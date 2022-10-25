# frozen_string_literal: true

module Search
  class PerformSearchCommand < ApplicationCommand

    def perform
      return Failure(search_query) unless search_query&.valid?

      Success(
        query_matches.merge(SearchEntry.where(search_query.model_filter))
      )
    end

    private

    attr_reader :search_query

    def initialize(search_query:)
      @search_query = search_query
    end

    def query_matches
      search_query
        .search_terms
        .map { |term| SearchEntry.with_text(term) }
        .reduce(&:merge)
    end

  end
end
