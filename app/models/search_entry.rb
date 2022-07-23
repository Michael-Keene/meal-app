# frozen_string_literal: true
class SearchEntry < ApplicationRecord

  belongs_to :searchable, polymorphic: true

end
