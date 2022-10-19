# frozen_string_literal: true

module Search
  class PerformSearchCommand < ApplicationCommand

    def perform
      return Failure(search_query) unless search_query&.valid?

      search_query
        .search_terms
        .map { |term| SearchEntry.with_text(term) }
        .reduce(&:merge)
    end

    private

    attr_reader :search_query

    def initialize(search_query:)
      @search_query = search_query
    end

  end
end
