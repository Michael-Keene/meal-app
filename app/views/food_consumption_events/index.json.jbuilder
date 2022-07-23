# frozen_string_literal: true
json.array! @food_consumption_events, partial: 'food_consumption_events/food_consumption_event',
                                      as: :food_consumption_event
