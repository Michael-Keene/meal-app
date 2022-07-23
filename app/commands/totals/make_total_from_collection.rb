# frozen_string_literal: true
module Totals
  class MakeTotalFromCollection < ApplicationCommand

    def perform
      {
        fat: total_fat,
        fibre: total_fibre,
        carbs: total_carbs,
        protein: total_protein,
        calories: total_calories,
        type: @total_type.to_sym,
        user: @user
      }
    end

    private

    def initialize(collection:, total_type:, user:)
      @collection = collection
      @total_type = total_type
      @user = user
    end

    %i[fat fibre carbs protein calories].each do |macro|
      define_method("total_#{macro}") do
        @collection.sum { |item| item.send(macro) }
      end
    end

  end
end
