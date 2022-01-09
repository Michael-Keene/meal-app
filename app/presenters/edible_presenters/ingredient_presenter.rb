module EdiblePresenters
  class IngredientPresenter < Base

    def initialize(ingredient)
      @ingredient = ingredient
      @food = ingredient.food
    end

    delegate :name, to: :food
    delegate :grams, to: :ingredient

    def edit_path
      Rails
        .application
        .routes
        .url_helpers
        .edit_meal_ingredient_path(ingredient, meal_id: ingredient.meal.id)
    end

    private

    attr_reader :food, :ingredient

    def stats_for_macro(macro)
      ratio*food.send(macro)
    end

    def ratio
      ingredient.grams/100
    end
  end
end
