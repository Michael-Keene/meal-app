module EdiblePresenters
  class FoodConsumptionEventPresenter < Base

    attr_reader :grams

    def initialize(consumption_event)
      @food = consumption_event.food
      @grams = consumption_event.grams
    end

    def name
      food.name
    end

    private

    def stats_for_macro(macro)
      food.send(macro)*grams/100
    end

    attr_reader :food
  end
end
