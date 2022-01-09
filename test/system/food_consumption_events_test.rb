require "application_system_test_case"

class FoodConsumptionEventsTest < ApplicationSystemTestCase
  setup do
    @food_consumption_event = food_consumption_events(:one)
  end

  test "visiting the index" do
    visit food_consumption_events_url
    assert_selector "h1", text: "Food consumption events"
  end

  test "should create food consumption event" do
    visit food_consumption_events_url
    click_on "New food consumption event"

    fill_in "Food", with: @food_consumption_event.food_id
    fill_in "Grams", with: @food_consumption_event.grams
    fill_in "User", with: @food_consumption_event.user_id
    click_on "Create Food consumption event"

    assert_text "Food consumption event was successfully created"
    click_on "Back"
  end

  test "should update Food consumption event" do
    visit food_consumption_event_url(@food_consumption_event)
    click_on "Edit this food consumption event", match: :first

    fill_in "Food", with: @food_consumption_event.food_id
    fill_in "Grams", with: @food_consumption_event.grams
    fill_in "User", with: @food_consumption_event.user_id
    click_on "Update Food consumption event"

    assert_text "Food consumption event was successfully updated"
    click_on "Back"
  end

  test "should destroy Food consumption event" do
    visit food_consumption_event_url(@food_consumption_event)
    click_on "Destroy this food consumption event", match: :first

    assert_text "Food consumption event was successfully destroyed"
  end
end
