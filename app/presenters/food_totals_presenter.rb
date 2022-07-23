# frozen_string_literal: true
class FoodTotalsPresenter < UserTargetsPresenter

  def initialize(totals)
    # totals must contain user info
    # and total type (Food vs Meal)
    @totals = totals
  end

  def name
    "Today's #{(totals.fetch(:type) { 'Intake' }).to_s.classify} Totals"
  end

  def dom_id
    "#{name} user #{(totals.fetch(:user) { @current_user }).id}".split.join('_').downcase.gsub("'", '')
  end

  private

  attr_reader :totals

  def stats_for_macro(macro)
    totals.fetch(macro) do
      raise NoMethodError, 'macro accessor not set'
    end
  end

end
