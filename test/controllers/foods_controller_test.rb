# frozen_string_literal: true
require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @food = foods(:one)
  end

  test 'should get index' do
    get foods_url
    assert_response :success
  end

  test 'should get new' do
    get new_food_url
    assert_response :success
  end

  test 'should create food' do
    assert_difference('Food.count') do
      post foods_url,
           params: { food: { calories: @food.calories, carbs: @food.carbs, fat: @food.fat, fibre: @food.fibre, name: @food.name,
                             protein: @food.protein } }
    end

    assert_redirected_to food_url(Food.last)
  end

  test 'should show food' do
    get food_url(@food)
    assert_response :success
  end

  test 'should get edit' do
    get edit_food_url(@food)
    assert_response :success
  end

  test 'should update food' do
    patch food_url(@food),
          params: { food: { calories: @food.calories, carbs: @food.carbs, fat: @food.fat, fibre: @food.fibre, name: @food.name,
                            protein: @food.protein } }
    assert_redirected_to food_url(@food)
  end

  test 'should destroy food' do
    assert_difference('Food.count', -1) do
      delete food_url(@food)
    end

    assert_redirected_to foods_url
  end

end
