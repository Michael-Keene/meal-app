module Search
  class CreateSearchEntryCommand < ApplicationCommand

    def perform
      unless has_pre_existing_entry?
        entry.update(searchable_name: searchable_object.name, searchable_text: searchable_object.try(:recipe))
      end
    end

    private

    attr_reader :searchable_object

    def initialize(searchable_object:)
      @searchable_object = searchable_object
    end

    def entry
      searchable_object.build_search_entry
    end

    def has_pre_existing_entry?
      searchable_object.search_entry.present?
    end
  end
end
