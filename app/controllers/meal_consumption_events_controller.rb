# frozen_string_literal: true
class MealConsumptionEventsController < ApplicationController

  before_action :set_meal_consumption_event, only: %i[show edit update destroy]

  # GET /meal_consumption_events or /meal_consumption_events.json
  def index
    @meal_consumption_events = MealConsumptionEvent.all
  end

  # GET /meal_consumption_events/new
  def new
    @meal_consumption_event = MealConsumptionEvent.new
  end

  # GET /meal_consumption_events/1/edit
  def edit; end

  # POST /meal_consumption_events or /meal_consumption_events.json
  def create
    @meal_consumption_event = MealConsumptionEvent.new(meal_consumption_event_params)
    @meal_consumption_event.user = current_user
    broadcast = broadcast_for(@meal_consumption_event)
    respond_to do |format|
      if @meal_consumption_event.save
        broadcast.perform(meal_consumption_event: @meal_consumption_event)
        format.html do
          redirect_to meal_consumption_event_url(@meal_consumption_event),
                      notice: 'Meal consumption event was successfully created.'
        end
        format.json { render :show, status: :created, location: @meal_consumption_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_consumption_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_consumption_events/1 or /meal_consumption_events/1.json
  def update
    respond_to do |format|
      if @meal_consumption_event.update(meal_consumption_event_params)
        Broadcasts::UpdateMealConsumptionEvent.perform(meal_consumption_event: @meal_consumption_event)
        format.html do
          redirect_to meal_consumption_event_url(@meal_consumption_event),
                      notice: 'Meal consumption event was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @meal_consumption_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_consumption_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_consumption_events/1 or /meal_consumption_events/1.json
  def destroy
    @meal_consumption_event.destroy

    respond_to do |format|
      format.html do
        redirect_to meal_consumption_events_url, notice: 'Meal consumption event was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal_consumption_event
    @meal_consumption_event = MealConsumptionEvent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_consumption_event_params
    params.require(:meal_consumption_event).permit(:meal_id)
  end

  def broadcast_for(meal_consumption_event)
    meal_consumption_event.new_record? ? Broadcasts::CreateMealConsumptionEvent : Broadcasts::UpdateMealConsumptionEvent
  end

end
