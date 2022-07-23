# frozen_string_literal: true
module Consumable
  extend ActiveSupport::Concern

  included do
    scope :consumed_on, ->(day) { where('created_at between ? and ?', day.beginning_of_day, day.end_of_day) }
  end
end
