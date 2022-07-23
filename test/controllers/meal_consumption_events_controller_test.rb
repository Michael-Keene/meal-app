# frozen_string_literal: true
require 'test_helper'

class MealConsumptionEventsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @meal_consumption_event = meal_consumption_events(:one)
  end

  test 'should get index' do
    get meal_consumption_events_url
    assert_response :success
  end

  test 'should get new' do
    get new_meal_consumption_event_url
    assert_response :success
  end

  test 'should create meal_consumption_event' do
    assert_difference('MealConsumptionEvent.count') do
      post meal_consumption_events_url,
           params: { meal_consumption_event: { meal_id: @meal_consumption_event.meal_id,
                                               user_id: @meal_consumption_event.user_id } }
    end

    assert_redirected_to meal_consumption_event_url(MealConsumptionEvent.last)
  end

  test 'should show meal_consumption_event' do
    get meal_consumption_event_url(@meal_consumption_event)
    assert_response :success
  end

  test 'should get edit' do
    get edit_meal_consumption_event_url(@meal_consumption_event)
    assert_response :success
  end

  test 'should update meal_consumption_event' do
    patch meal_consumption_event_url(@meal_consumption_event),
          params: { meal_consumption_event: { meal_id: @meal_consumption_event.meal_id,
                                              user_id: @meal_consumption_event.user_id } }
    assert_redirected_to meal_consumption_event_url(@meal_consumption_event)
  end

  test 'should destroy meal_consumption_event' do
    assert_difference('MealConsumptionEvent.count', -1) do
      delete meal_consumption_event_url(@meal_consumption_event)
    end

    assert_redirected_to meal_consumption_events_url
  end

end
