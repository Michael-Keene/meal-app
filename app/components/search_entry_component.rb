# frozen_string_literal: true

class SearchEntryComponent < ViewComponent::Base

  def initialize(search_entry:)
    @search_entry = search_entry
  end

  def text
    @search_entry.searchable.name
  end

end
