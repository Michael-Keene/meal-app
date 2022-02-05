class SearchQuery

  include ActiveModel::Validations

  validate :search_term_is_string?

  def initialize(query)
    @query = query
  end

  def search_terms
    query
      .to_s # squash nil to ""
      .split
  end

  private

  attr_reader :query

  def search_term_is_string?
    unless query.is_a? String || query.nil? # we accept empty queries
      errors.add(:query, "not a valid query, must be a string")
    end
  end

end
