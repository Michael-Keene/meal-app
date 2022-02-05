class SearchEntriesController < ApplicationController

  def index
    query = SearchQuery.new(search_query)
    if query.valid?
      @results = SearchEntry.all

      query.search_terms.each do |term|
        apply_search_term(term)
      end
    else
      return head :bad_request unless query.valid?
    end
  end

  private

  def apply_search_term(term)
    @results = @results
               .where("searchable_name like '%#{term}%'")
               .or(SearchEntry.where("searchable_text like '%#{term}%'"))
  end

  def search_query
    params.require(:query) if params[:query].present?
  end
end
