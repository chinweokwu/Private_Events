module ApplicationHelper
    def user_allowed
        user_signed_in? && (current_user.id == @event.creator_id)
      end
end
