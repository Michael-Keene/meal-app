# frozen_string_literal: true

module Meals
  class SearchEntriesController < SearchEntriesController

    private

    def query
      super.search_only_in_model(Meal)
    end

  end
end
