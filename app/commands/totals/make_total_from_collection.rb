module Totals
  class MakeTotalFromCollection < ApplicationCommand

    def perform
      {
        fat: total_fat,
        fibre: total_fibre,
        carbs: total_carbs,
        protein: total_protein,
        calories: total_calories,
        type: @total_type.to_sym
      }
    end

    private

    def initialize(collection, total_type)
      @collection = collection
      @total_type = total_type
    end

    [:fat, :fibre, :carbs, :protein, :calories].each do |macro|
      define_method("total_#{macro}") do
        @collection.sum { |item| item.send(macro) }
      end
    end
  end
end
