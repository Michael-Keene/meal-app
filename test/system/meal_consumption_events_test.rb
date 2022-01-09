require "application_system_test_case"

class MealConsumptionEventsTest < ApplicationSystemTestCase
  setup do
    @meal_consumption_event = meal_consumption_events(:one)
  end

  test "visiting the index" do
    visit meal_consumption_events_url
    assert_selector "h1", text: "Meal consumption events"
  end

  test "should create meal consumption event" do
    visit meal_consumption_events_url
    click_on "New meal consumption event"

    fill_in "Meal", with: @meal_consumption_event.meal_id
    fill_in "User", with: @meal_consumption_event.user_id
    click_on "Create Meal consumption event"

    assert_text "Meal consumption event was successfully created"
    click_on "Back"
  end

  test "should update Meal consumption event" do
    visit meal_consumption_event_url(@meal_consumption_event)
    click_on "Edit this meal consumption event", match: :first

    fill_in "Meal", with: @meal_consumption_event.meal_id
    fill_in "User", with: @meal_consumption_event.user_id
    click_on "Update Meal consumption event"

    assert_text "Meal consumption event was successfully updated"
    click_on "Back"
  end

  test "should destroy Meal consumption event" do
    visit meal_consumption_event_url(@meal_consumption_event)
    click_on "Destroy this meal consumption event", match: :first

    assert_text "Meal consumption event was successfully destroyed"
  end
end
