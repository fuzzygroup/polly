module ApplicationHelper
  def render_flash_message(key)
    if flash[key]
      css_class = key.to_s == "notice" ? "success" : "danger"
      content_tag :div, flash[key], class: "alert alert-#{css_class}"
    end
  end
  
  def show_kst(time_obj)
    time_obj.strftime("%I:%M %p")
  end
  
  def add_link_bar_spacer
    "&nbsp;&nbsp;&nbsp;".html_safe
  end
  
  #
  # NOTE: obj is an object which is only 1 method call away from user 
  # example: speech.speaker has speech.speaker.user
  #
  def link_to_user_if_exists(obj)
    if obj.try(:user)
      link_to(obj.user.full_name, obj.user)
    else
      obj.full_name
    end
  end
  
  def link_to_speech_if_exists(obj)
    #return
    if obj.try(:speech)
      link_to(obj.speech.name, obj.speech)
    else
      obj.name
    end
  end
  
  def show_speech_link(speech)
    output = []
    if speech.event
      date = speech.event.date_start.to_s
    else speech
      date =speech.created_at.to_s
    end
    output << link_to("#{date} : #{speech.name}", speech_path(speech))
    #output << " by #{link_to(speech.speaker.full_name, speaker_path(speech.speaker)}"
    output.join("").html_safe
  end
  
  def show_event_action_links(event)
    return if Rails.env.production?
    return
    return if event.show_action_links == false
    # return if event is in the past 
    return if event.date_start < Time.now.to_date
    output = []
    output << "<p class='text-center'>"
    output << link_to("I want to Attend", new_event_attendance_path(slug: event.slug))
    output << add_link_bar_spacer
    output << link_to("I want to Volunteer", new_event_volunteer_path(slug: event.slug))
    output << add_link_bar_spacer
    if event.has_speakers?
      output << link_to("I want to Speak", new_speaker_path(slug: event.slug)) if event.has_speakers?
      output << add_link_bar_spacer
    end
    output << link_to("I want to Add a Task", new_event_task_path(slug: event.slug)) if current_user && current_user.is_admin?
    output << '</p>'
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
  
  def show_id_col
    return '' if current_user.nil?
    return '' if current_user.is_not_superuser?
    output = []
    
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

    if obj.availability == true
      msg = 'Available' 
    else 
      msg = 'Away'
    end
    #return 'Away' if obj.availability == false
    return link_to(msg, availability_path(obj ))
  end
  
  def chat_link(obj)
    return link_to("Go", obj.chat_url)
  end
  
  def show_poll_options(form, poll_options)
    form.collection_radio_buttons :value, poll_options, :id, :name
  end
end
