module EdiblePresenters
  class Base

    def initialize
      raise NotImplementedError
    end

    [:fat, :fibre, :carbs, :protein, :calories].each do |macro|
      define_method(macro) do
        stats_for_macro(macro).round(2)
      end
    end

    def dom_id(*args)
      raise NotImplementedError
    end

    def edit_path
      raise NotImplementedError
    end

    private

    def stats_for_macro
      raise NotImplementedError
    end
  end
end
