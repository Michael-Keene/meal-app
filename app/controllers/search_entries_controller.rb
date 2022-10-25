# frozen_string_literal: true
class SearchEntriesController < ApplicationController

  def index
    query_attempt = Search::PerformSearchCommand.perform(search_query: query)
    return head :bad_request unless query_attempt.success?

    matching_search_entries = query_attempt.value!

    set_parent_item
    @results = matching_search_entries.map do |search_entry|
      SearchEntryCardComponent.new(search_entry: search_entry, item_to_add_or_remove_from: @parent_item)
    end

    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('search_results', partial: 'results')
      end
    end
  end

  private

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

  def model_to_search
    params[:target_model].classify.constantize
  end

  def search_query
    params.require(:query) if params[:query].present?
  end

  def query
    SearchQuery.new(search_query)
  end

end
