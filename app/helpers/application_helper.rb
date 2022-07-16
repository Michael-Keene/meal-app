module ApplicationHelper

  p EdiblePresenters::MealPresenter
  p EdiblePresenters::IngredientPresenter

  def present(object, given_presenter = nil)
    presenter = (given_presenter ||  find_presenter(object)).new(object)
    yield(presenter) if block_given?
    presenter
  end

  def find_presenter(object)
    if object.edible?
      presenter = "EdiblePresenters::#{object.class.name}Presenter".constantize
      raise "not correct parent" unless presenter.ancestors.include? EdiblePresenters::Base
      presenter
    end
  end

  def root_path
    daily_log_path
  end

  def root_url
    daily_log_url
  end

  def nav_item_selected?(path)
    if path == root_path
      request.url == root_url
    else
      request.url.start_with? request.base_url + path
    end
  end
end
