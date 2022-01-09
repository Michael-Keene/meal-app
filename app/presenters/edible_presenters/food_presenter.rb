module EdiblePresenters
  class FoodPresenter < Base

    def initialize(food)
      @food = food
    end

    delegate :fat,
             :fibre,
             :carbs,
             :protein,
             :calories, to: :food

    def supplementry_text
    end

    private

    attr_reader :food

  end
end
