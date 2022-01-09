require "test_helper"

class FoodConsumptionEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_consumption_event = food_consumption_events(:one)
  end

  test "should get index" do
    get food_consumption_events_url
    assert_response :success
  end

  test "should get new" do
    get new_food_consumption_event_url
    assert_response :success
  end

  test "should create food_consumption_event" do
    assert_difference("FoodConsumptionEvent.count") do
      post food_consumption_events_url, params: { food_consumption_event: { food_id: @food_consumption_event.food_id, grams: @food_consumption_event.grams, user_id: @food_consumption_event.user_id } }
    end

    assert_redirected_to food_consumption_event_url(FoodConsumptionEvent.last)
  end

  test "should show food_consumption_event" do
    get food_consumption_event_url(@food_consumption_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_consumption_event_url(@food_consumption_event)
    assert_response :success
  end

  test "should update food_consumption_event" do
    patch food_consumption_event_url(@food_consumption_event), params: { food_consumption_event: { food_id: @food_consumption_event.food_id, grams: @food_consumption_event.grams, user_id: @food_consumption_event.user_id } }
    assert_redirected_to food_consumption_event_url(@food_consumption_event)
  end

  test "should destroy food_consumption_event" do
    assert_difference("FoodConsumptionEvent.count", -1) do
      delete food_consumption_event_url(@food_consumption_event)
    end

    assert_redirected_to food_consumption_events_url
  end
end
