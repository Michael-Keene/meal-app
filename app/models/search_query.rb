# frozen_string_literal: true
class SearchQuery

  include ActiveModel::Validations

  validate :search_term_is_string?
  validate :model_to_search_is_searchable?

  attr_reader :model_to_search

  def initialize(query)
    @query = query
  end

  def search_only_in_model(model)
    raise :model_already_set if @model_to_search

    @model_to_search = model
  end

  def search_terms
    return [""] if query.blank?

    query.split
  end

  def model_filter
    return unless model_to_search

    {searchable_type: model_to_search.name}
  end

  private

  attr_reader :query

  def search_term_is_string?
    unless query.is_a?(String) || query.nil? # we accept empty queries
      errors.add(:query, 'not a valid query, must be a string')
    end
  end

  def model_to_search_is_searchable?
    return unless model_to_search

    unless model_to_search.is_a?(Class) && model_to_search.include?(Searchable)
      errors.add(:model_to_search, "#{model_to_search} is not a searchable model")
    end
  end

end
