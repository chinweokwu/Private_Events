class UsersController < ApplicationController
    def index
        @user = current_user.event_attendees.find(attended_event_id: @event.id)
        current_user.attend!(@event)
        redirect_to @event
      end
end
