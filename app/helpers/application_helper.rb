module ApplicationHelper

  def present(object, given_presenter = find_presenter(object))
    presenter = given_presenter.new(object)
    yield(presenter) if block_given?
    presenter
  end

  def find_presenter(object)
    if object.edible?
      EdiblePresenters::Base.descendants.find do |presenter|
        presenter.name.match? "EdiblePresenters::#{object.class.name}Presenter"
      end
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
