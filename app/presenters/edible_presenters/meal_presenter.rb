module EdiblePresenters
  class MealPresenter < Base

    def initialize(meal)
      @meal = meal
      @macros = IngredientMacros.where(ingredient: meal.ingredients)
    end

    private

    def stats_for_macro(macro)
      macros.sum(macro)
    end

    attr_reader :meal, :macros

  end
end
