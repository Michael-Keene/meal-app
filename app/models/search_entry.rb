# frozen_string_literal: true
class SearchEntry < ApplicationRecord

  belongs_to :searchable, polymorphic: true

  scope :with_text, ->(text) do
    q = "%#{text}"
    where("searchable_name like ?", q).or(where("searchable_text like ?", q))
  end

end
