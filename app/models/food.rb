class Food < ApplicationRecord

  include Edible
  include Searchable

end
