module Search
  class UpdateSearchEntryCommand < ApplicationCommand

    def perform
      entry.update(searchable_name: searchable_object.name, searchable_text: searchable_object.try(:recipe))
    end

    private

    attr_reader :searchable_object, :entry

    def initialize(searchable_object:)
      @searchable_object = searchable_object
      @entry = searchable_object.search_entry
    end
  end
end
