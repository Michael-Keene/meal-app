class FoodConsumptionEventsController < ApplicationController
  before_action :set_food_consumption_event, only: %i[ show edit update destroy ]

  # GET /food_consumption_events or /food_consumption_events.json
  def index
    @food_consumption_events = FoodConsumptionEvent.all
  end

  # GET /food_consumption_events/1 or /food_consumption_events/1.json
  def show
  end

  # GET /food_consumption_events/new
  def new
    @food_consumption_event = FoodConsumptionEvent.new
  end

  # GET /food_consumption_events/1/edit
  def edit
  end

  # POST /food_consumption_events or /food_consumption_events.json
  def create
    @food_consumption_event = new_or_existing_consumption_event
    @food_consumption_event.grams = @food_consumption_event.grams.to_f + food_consumption_event_params[:grams].to_f

    respond_to do |format|
      if @food_consumption_event.save
        format.html { redirect_to food_consumption_event_url(@food_consumption_event), notice: "Food consumption event was successfully created." }
        format.json { render :show, status: :created, location: @food_consumption_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_consumption_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_consumption_events/1 or /food_consumption_events/1.json
  def update
    respond_to do |format|
      if @food_consumption_event.update(food_consumption_event_params)
        format.html { redirect_to food_consumption_event_url(@food_consumption_event), notice: "Food consumption event was successfully updated." }
        format.json { render :show, status: :ok, location: @food_consumption_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_consumption_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_consumption_events/1 or /food_consumption_events/1.json
  def destroy
    @food_consumption_event.destroy

    respond_to do |format|
      format.html { redirect_to food_consumption_events_url, notice: "Food consumption event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_consumption_event
      @food_consumption_event = FoodConsumptionEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_consumption_event_params
      params.require(:food_consumption_event).permit(:food_id, :grams)
    end

    def new_or_existing_consumption_event
      food_id = food_consumption_event_params[:food_id]
      current_user
        .todays_food
        .where(food_id: food_id)
        .take|| FoodConsumptionEvent.new(user: current_user, food_id: food_id)
    end
end
