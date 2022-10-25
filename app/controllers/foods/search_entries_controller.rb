# frozen_string_literal: true

module Foods
  class SearchEntriesController < SearchEntriesController

    private

    def query
      SearchQuery.new(search_query, model_to_search: Food)
    end

  end
end
