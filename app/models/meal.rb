class Meal < ApplicationRecord
  include Edible

  has_many :ingredients

end
