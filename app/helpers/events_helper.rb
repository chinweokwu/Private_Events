module EventsHelper
    def attend_event(current_user)
        if user_signed_in? && @event.date  > Date.today
            render :partial => 'events/attend_event'
        end
    end

    def attend(current_user)
        if user_signed_in? && current_user.attending?(@event) 
            render :partial => 'events/cancel_event'
	    else
            render :partial => 'events/attend_event'
        end
    end

    def attendee
        if @event.attendees.any? 
            @event.attendees.each do |attendee|
             attendee.username
            end
        else 
            No attendees
        end
    end
end
