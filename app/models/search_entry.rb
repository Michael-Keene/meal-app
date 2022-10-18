# frozen_string_literal: true
class SearchEntry < ApplicationRecord

  belongs_to :searchable, polymorphic: true

  scope :with_text, ->(text) { where("searchable_name like '%#{text}%'").or(where("searchable_text like '%#{text}%'"))}

end
