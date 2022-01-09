class ShoppingMealAssociation < ApplicationRecord
  belongs_to :meal
  belongs_to :shopping_list
end
