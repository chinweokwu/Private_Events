module UsersHelper
    def future_attended_events(user)
        future_events = @attended_events.future
    end

    def current_user?(user)
        current_user == user
    end
end
