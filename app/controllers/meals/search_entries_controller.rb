# frozen_string_literal: true

module Meals
  class SearchEntriesController < SearchEntriesController

    private

    def query
      SearchQuery.new(search_query, model_to_search: Meal)
    end

  end
end
