module ApplicationHelper

  def present(object)
    presenter = if object.edible?
                  klass = EdiblePresenters::Base.descendants.find do |presenter|
                    p [presenter.name, "EdiblePresenters::#{object.class.name}Presenter"]
                    presenter.name.match? "EdiblePresenters::#{object.class.name}Presenter"
                  end
                  klass.new(object)
                end
    yield(presenter) if block_given?
  end

  def nav_item_selected?(path)
    if path == root_path
      request.url == root_url
    else
      request.url.start_with? request.base_url + path
    end
  end
end
