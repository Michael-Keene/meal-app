class SearchEntry < ApplicationRecord
  belongs_to :searchable, polymorphic: true
end
