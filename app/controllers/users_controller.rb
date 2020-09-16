class UsersController < ApplicationController
  def index
    @user = current_user
    @created_events = current_user.events
    @future_events = Event.future_events
    @attended_events = @user.attended_events
  end
end
