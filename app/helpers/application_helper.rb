module ApplicationHelper
  def render_flash_message(key)
    if flash[key]
      css_class = key.to_s == "notice" ? "success" : "danger"
      content_tag :div, flash[key], class: "alert alert-#{css_class}"
    end
  end
  
  def show_event_action_links(event)
    output = []
    output << link_to("I want to Attend", new_event_attendance_path(slug: event.slug))
    output << "&nbsp;|&nbsp;"
    output << link_to("I want to Volunteer", new_event_volunteer_path(slug: event.slug))
    output << "&nbsp;|&nbsp;" if event.has_speakers?
    output << link_to("I want to Speak", new_speaker_path(slug: event.slug)) if event.has_speakers?
    output.join("").html_safe
    # <%#= )%>
    #
    # <%= %>
    # &nbsp;|&nbsp;
    # <%= %>
    # output.join("\n").to_s
  end
  
  def show_edit_link(obj)
      #<%#= link_to "Edit this team", edit_team_path(@team) %> |
  end
  
  def show_destroy_link(obj)
    #  <%#= button_to "Destroy this team", @team, method: :delete %>
  end
  
  def show_active(obj)
    if obj.respond_to?(:active)
      return 'Yes' if obj.active
      return 'No'
    elsif obj.respond_to?(:availability)
      return 'Yes' if obj.active
      return 'No'
    end
  end
  
  def show_yes_no(boolean_field)
    return 'Yes' if boolean_field
    return 'No'
  end
  
  def show_availability(obj)
    return 'Available' if obj.availability == true
    return 'Away' if obj.availability == false
  end
  
  def chat_link(obj)
    return link_to("Go", obj.chat_url)
  end
  
  def show_poll_options(form, poll_options)
    form.collection_radio_buttons :value, poll_options, :id, :name
  end
end
