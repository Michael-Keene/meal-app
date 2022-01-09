module EdiblePresenters
  class MealConsumptionEventPresenter < MealPresenter

    def initialize(meal_consumption_event)
      super(meal_consumption_event.meal)
    end

  end
end
