module ApplicationHelper
  def render_flash_message(key)
    if flash[key]
      css_class = key.to_s == "notice" ? "success" : "danger"
      content_tag :div, flash[key], class: "alert alert-#{css_class}"
    end
  end
  
  def show_active(obj)
    return 'Yes' if obj.active
    return 'No'
  end
  
  def chat_link(obj)
    return link_to("Chat", obj.chat_url)
  end
  
  def show_poll_options(form, poll_options)
    form.collection_radio_buttons :value, poll_options, :id, :name
  end
end
