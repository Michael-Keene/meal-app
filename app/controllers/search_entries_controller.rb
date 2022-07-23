# frozen_string_literal: true
class SearchEntriesController < ApplicationController

  def index
    query = SearchQuery.new(search_query)
    return head :bad_request unless query.valid?

    set_parent_item
    @search_results = initial_scope

    query.search_terms.each do |term|
      apply_search_term(term)
    end

    @results = @search_results.map do |result|
      SearchEntryCardComponent.new(search_entry: result, item_to_add_or_remove_from: @parent_item)
    end

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_results', partial: 'results')
      end
    end
  end

  private

  def apply_search_term(term)
    @search_results = @search_results
                      .where("searchable_name like '%#{term}%'")
                      .or(@search_results.where("searchable_text like '%#{term}%'"))
  end

  def set_parent_item
    @parent_item ||= parent_item_class.find(params[:parent_item_id])
  end

  def parent_item_class
    klass = params[:parent_item_type].constantize
    unless [Meal, User].include? klass
      return head :bad_request
    end # TODO: replace this hard coded list with some ducktype check

    klass
  end

  def search_query
    params.require(:query) if params[:query].present?
  end

  def initial_scope
    if food_only?
      SearchEntry.where(searchable_type: 'Food')
    else
      SearchEntry.all
    end
  end

  def food_only?
    params[:food_only] == 'true'
  end

end
