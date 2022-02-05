class Meal < ApplicationRecord
  include Edible
  include Searchable

  has_many :ingredients

end
