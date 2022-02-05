class SearchEntryController < ApplicationController

  def index
    @scope = SearchEntry.all
    search_query.split.each do |term|
      apply_search_term(term)
    end
  end

  private

  def apply_search_term(term)
    @scope = @scope
               .where("searchable_name like '%#{term}%'")
               .or(SearchEntry.where("searchable_text like '%#{term}%'"))
  end

  def search_query
    params.require(:query)
  end
end
