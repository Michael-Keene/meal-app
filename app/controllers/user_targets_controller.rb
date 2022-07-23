# frozen_string_literal: true
class UserTargetsController < ApplicationController

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if current_user.update(target_params)
        format.html { redirect_to daily_log_url, notice: 'Targets were successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def target_params
    params.require(:user).permit(:fat, :carbs, :calories, :fibre, :protein)
  end

end
