# frozen_string_literal: true
module Broadcasts
  class UpdateTodaysMeals < ApplicationCommand

    def perform
      user.broadcast_replace_to(
        :todays_totals,
        target: UserTargetsPresenter.new(meal_totals).dom_id,
        partial: 'edibles/row',
        locals: {
          edible: meal_totals,
          no_quantity: true,
          no_header: true,
          presenter: UserTargetsPresenter
        }
      )
    end

    private

    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def meal_totals
      @meal_totals ||= Totals::MakeTotalFromCollection.perform(collection: user.todays_meals, total_type: :meal,
                                                               user: user)
    end

  end
end
