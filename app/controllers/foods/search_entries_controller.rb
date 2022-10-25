# frozen_string_literal: true

module Foods
  class SearchEntriesController < SearchEntriesController

    private

    def query
      super.search_only_in_model(Food)
    end

  end
end
