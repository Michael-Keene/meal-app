class SearchEntriesController < ApplicationController

  def index
    query = SearchQuery.new(search_query)
    return head :bad_request unless query.valid?

    @results = SearchEntry.all

    query.search_terms.each do |term|
      apply_search_term(term)
    end

    respond_to do |format|
      format.html
      format.turbo_stream {
        render turbo_stream: turbo_stream.update("search_results", partial: "results")
      }
    end

  end

  private

  def apply_search_term(term)
    @results = @results
               .where("searchable_name like '%#{term}%'")
               .or(@results.where("searchable_text like '%#{term}%'"))
  end

  def search_query
    params.require(:query) if params[:query].present?
  end
end
