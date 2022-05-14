module EdiblePresenters
  # All the stats for this class are the meal, but we want to edit the fact that we ate it
  class MealConsumptionEventPresenter < MealPresenter

    delegate_missing_to :presented_meal

    def initialize(meal_consumption_event)
      @meal_consumption_event = meal_consumption_event
      @presented_meal = super(meal_consumption_event.meal)
    end

    def edit_path
      Rails
        .application
        .routes
        .url_helpers
        .edit_meal_consumption_event_path(@meal_consumption_event)
    end

    private

    attr_reader :presented_meal
  end
end
