# frozen_string_literal: true

require 'rmagick'
require 'rqrcode'

module ImageGeneration
  class ImageComposer
    include Magick

    DEFAULT_WIDTH  = 1570
    DEFAULT_HEIGHT = 2048
    DEFAULT_LOGO_PATH = Rails.root.join('app/assets/images/flierlogo.png').to_s
    DEFAULT_FONT_PATH = Rails.root.join('app/assets/images/break-down.ttf').to_s
    DEFAULT_MARGIN = 60


    def initialize(output_width: DEFAULT_WIDTH, output_height: DEFAULT_HEIGHT, background_color: 'white', margin: DEFAULT_MARGIN, gradient: nil)
      @width = output_width
      @height = output_height
      @margin = margin

      if gradient
        @canvas = create_gradient_background(*gradient)
      else
        @canvas = Magick::Image.new(@width, @height)
        draw = Magick::Draw.new
        draw.fill(background_color)
        draw.rectangle(0, 0, @width, @height)
        draw.draw(@canvas)
      end
    end

    def add_overlay(png_path, x:, y:, scale_to: nil)
      overlay = Image.read(png_path).first
      overlay.resize_to_fit!(scale_to, scale_to) if scale_to
      @canvas.composite!(overlay, x, y, OverCompositeOp)
    end

    def add_text(text, x:, y:, font_size: 48, color: 'black', font: nil, rotate: 0)
      draw = Magick::Draw.new
      draw.font = font if font
      draw.pointsize = font_size
      draw.fill = color
      draw.gravity = Magick::NorthWestGravity
      draw.rotation = rotate unless rotate == 0  # Apply rotation only if needed
      draw.annotate(@canvas, 0, 0, x, y, text)
    end

    def generate_qr_code(qr_text, pixel_size: 10, border_modules: 1)
      qr = RQRCode::QRCode.new(qr_text)
      png = qr.as_png(
        border_modules: border_modules,
        module_px_size: pixel_size,   # Use this to control actual pixel size
        size: nil                     # Leave `size` nil to avoid conflict
      )
      img = Magick::Image.from_blob(png.to_s).first
      img.format = 'PNG'
      img
    end

    def add_qr_code(qr_text, x:, y:, pixel_size: 10)
      qr_img = generate_qr_code(qr_text, pixel_size: pixel_size)
      @canvas.composite!(qr_img, x, y, OverCompositeOp)
    end



    def create_gradient_background(from_color, to_color, direction)
      gradient = Magick::GradientFill.new(
        0, 0,
        direction == :horizontal ? @width : 0,
        direction == :vertical   ? @height : 0,
        from_color, to_color
      )
      Magick::Image.new(@width, @height, gradient)
    end

    def compose_event_flyer(
      event_title:,
      event_date:,
      event_time:,
      event_place:,
      logofile: DEFAULT_LOGO_PATH,
      qr_text: nil
    )
      # Add logo in top-left
      add_overlay(logofile, x: @margin, y: @margin, scale_to: 750)

      # Add title diagonally
      angle = -45
      diagonal_x = @width/4.25
      diagonal_y = @height/1.5

      # Add event info block bottom right
      info_x = @width - 460
      info_y = @height/1.85

      add_text(event_title, x: diagonal_x, y: diagonal_y, font_size: 140, rotate: angle, font: DEFAULT_FONT_PATH)

      # And optionally for the rest:
      add_text(event_date,  x: info_x, y: info_y + 120, font_size: 48)
      add_text(event_time,  x: info_x, y: info_y + 200, font_size: 48)
      add_text(event_place, x: info_x, y: info_y + 280, font_size: 38)

      # Add QR code below the info block
      add_qr_code(qr_text, x: info_x - 20, y: info_y + 380, pixel_size: 15) if qr_text
    end

    def save_to(path)
      @canvas.write(path)
    end
  end
end
