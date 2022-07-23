# frozen_string_literal: true

class SearchEntryCardComponent < ViewComponent::Base

  include SearchEntryHelper

  def initialize(search_entry:, item_to_add_or_remove_from:)
    @search_entry = search_entry
    @searchable = search_entry.searchable
    @item_to_add_or_remove_from = item_to_add_or_remove_from
  end

  def create_url
    food_item_create_url(@searchable, @item_to_add_or_remove_from)
  end

  def glue_layer_item
    case [@searchable, @item_to_add_or_remove_from].map(&:class)
    when [Food, Meal]
      Ingredient.new
    when [Food, User]
      FoodConsumptionEvent.new
    when [Meal, User]
      MealConsumptionEvent.new
    end
  end

  def text
    @searchable.name
  end

  def url
    url_for(@searchable)
  end

  def render_quantity?
    glue_layer_item.class.column_names.include? 'grams'
  end

  def parent_description
    case @item_to_add_or_remove_from
    when User
      'todays intake'
    when Meal
      'Meal'
    end
  end

end
