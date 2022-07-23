#!/usr/bin/env ruby
# frozen_string_literal: true

require 'thor'

class SearchEntries < Thor

  desc 'ensure_indexed', 'makes sure edible food is indexed'
  def ensure_indexed
    Food.all.each do |food|
      next if SearchEntry.find_by(searchable_type: food.class.name, searchable_id: food.id)

      Search::CreateSearchEntryCommand.perform(searchable_object: food)
    end
    Meal.all.each do |meal|
      next if SearchEntry.find_by(searchable_type: meal.class.name, searchable_id: meal.id)

      Search::CreateSearchEntryCommand.perform(searchable_object: meal)
    end
  end

  desc 'clear_search_entries', 'deletes all dearch entries held'
  def clear_search_entries
    SearchEntry.all.destroy_all
  end

  desc 'clean_re_index', 'clears the search index and re-indexes items'
  def clean_re_index
    invoke :clear_search_entries
    invoke :ensure_indexed
  end

end
