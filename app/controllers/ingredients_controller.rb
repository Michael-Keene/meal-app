class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  before_action :set_meal

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients or /ingredients.json
  def create
    if existing_ingredient_for_food(food)
      @ingredient = existing_ingredient_for_food(food)
      @ingredient.grams += ingredient_params[:grams].to_f
      broadcast = -> { @ingredient
                         .broadcast_replace_to(
                           :ingredient_rows,
                           target: @ingredient,
                           partial: "ingredients/ingredient_row",
                           locals: {ingredient: @ingredient}
                         )
      }
    else
     @ingredient = @meal.ingredients.new(ingredient_params)
     broadcast = -> { @ingredient
                        .broadcast_append_to(
                          :ingredient_rows,
                          target: :ingredient_rows,
                          partial: "ingredients/ingredient_row",
                          locals: {ingredient: @ingredient}
                        )
     }
    end

    respond_to do |format|
      if @ingredient.save
        broadcast.call
        format.turbo_stream {
          render turbo_stream: turbo_stream.update(
                   "new_ingredient",
                   partial: "ingredients/form",
                   locals: {
                     ingredient: @meal.ingredients.new,
                     notice: "Ingredient was successfully created."}
                 )
        }
        format.html { redirect_to meal_ingredient_url(@ingredient), notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to meal_ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to meal_url(@meal), notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def existing_ingredient_for_food(food)
    @meal.ingredients.with_food(food).last
  end

  def food
   @food ||= Food.find(ingredient_params[:food_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:food_id, :grams)
  end
end
