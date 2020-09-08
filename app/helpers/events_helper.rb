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

    def attendee_list
        if @event.attendees.any? 
            render :partial => 'events/attendee_list'
        else 
            'No Attendees'
        end
    end
end
