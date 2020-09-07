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
end
