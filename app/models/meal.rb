class Meal < ApplicationRecord
  include Edible
  include Searchable

  has_many :ingredients

  [:fat, :fibre, :carbs, :protein, :calories].each do |macro|
    define_method(macro) do
      ingredients.includes(:macros).sum { |ingredient| ingredient.macros.send(macro) }
    end
  end

end
