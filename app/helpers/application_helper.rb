module ApplicationHelper
  def user_allowed
    user_signed_in? && (current_user.id == @event.creator_id)
  end

  def future_attended_events(user)
    future_events = @attended_events.future
  end

  def current_user?(user)
    current_user == user
  end

  def notification(notice, alert)
    if notice
      content_tag(:p, notice, class: 'notice notification is-primary global-notification')
    elsif alert
      content_tag(:p, alert, class: 'alert notification is-danger global-notification')
    end
  end

  def show_user
    if user_allowed
      (link_to 'Edit', edit_event_path(@event)) +
      (link_to 'Destroy', @event, method: :delete, data: { confirm: 'Are you sure?' })
    end
  end

  def login_helper(current_user)
    if user_signed_in?     
      render :partial => 'layouts/signed_in'
    else
      (link_to 'Events', events_path , class:"navbar-item")+
      (link_to "Sign In", new_user_session_path, class:"navbar-item")+
      (link_to "Sign up", new_user_registration_path, class:"navbar-item")
    end
  end

end
