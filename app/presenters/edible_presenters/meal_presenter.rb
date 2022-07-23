# frozen_string_literal: true
module EdiblePresenters
  class MealPresenter < Base

    def initialize(meal)
      @meal = meal
      @macros = IngredientMacros.where(ingredient: meal.ingredients)
    end

    delegate :name, to: :meal

    def grams
      meal.ingredients.sum(:grams)
    end

    def edit_path
      Rails
        .application
        .routes
        .url_helpers
        .edit_meal_path(meal)
    end

    def dom_id(prefix = nil)
      ActionView::RecordIdentifier.dom_id(
        meal,
        prefix
      )
    end

    private

    def stats_for_macro(macro)
      macros.sum(macro)
    end

    attr_reader :meal, :macros

  end
end
