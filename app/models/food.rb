# frozen_string_literal: true
class Food < ApplicationRecord

  include Edible
  include Searchable

end
