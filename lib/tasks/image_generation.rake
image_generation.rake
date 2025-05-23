namespace :image_generation do
  desc "Generate a test event flyer with default logo and text"
  task generate: :environment do
    require Rails.root.join('lib/image_generation/image_composer')

    output_path = Rails.root.join('tmp', 'test_output.png')

    composer = ImageGeneration::ImageComposer.new(gradient: ['#ffffff', '#0000ff', :horizontal])

    composer.compose_event_flyer(
      event_title: "ruby for rebels",
      event_date: "june 12, 2025",
      event_time: "7:00 pm",
      event_place: "almondtree cultural hall",
      qr_text: "Scott is hot"
      # logofile: optional; will use default if omitted
    )
    composer.save_to(output_path.to_s)

    puts "Image generated and saved to #{output_path}"
  end
end
