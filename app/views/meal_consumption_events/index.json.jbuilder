# frozen_string_literal: true
json.array! @meal_consumption_events, partial: 'meal_consumption_events/meal_consumption_event',
                                      as: :meal_consumption_event
