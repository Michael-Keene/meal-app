# frozen_string_literal: true

class SearchEntryCardComponent < ViewComponent::Base

  include SearchEntryHelper

  def initialize(search_entry:, item_to_add_or_remove_from:)
    @search_entry = search_entry
    @searchable = search_entry.searchable
    @item_to_add_or_remove_from = item_to_add_or_remove_from
  end

  def create_url
    create_url(@searchable, @item_to_add_or_remove_from)
  end

  def text
    @searchable.name
  end

  def url
    url_for(@searchable)
  end

  def render_quantity?
    @searchable.column_names.include? "grams"
  end

end
