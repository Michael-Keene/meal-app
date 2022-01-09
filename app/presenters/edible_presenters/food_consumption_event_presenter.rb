module EdiblePresenters
  class FoodConsumptionEventPresenter < Base

    def initialize(consumption_event)
      @food = consumption_event.food
      @grams = consumption_event.grams
    end

    private

    def stats_for_macro(macro)
      food.send(macro)*grams/100
    end

    attr_reader :food, :grams
  end
end
