# frozen_string_literal: true
class ShoppingMealAssociation < ApplicationRecord

  belongs_to :meal
  belongs_to :shopping_list

end
