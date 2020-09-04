require 'test-helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test 'should get new' do
    get new_event_url
    assert_response :success
  end

  test 'should create event' do
    get events_create_url
    assert_response :success
  end

  test 'should show event' do
    get event_url(@event)
    assert_response :success
  end
end
