class HomeController < ApplicationController
  def index
    @events = Event.all
    @attendees = @event.attendees.all
  end
end
