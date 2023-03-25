# frozen_string_literal: true

class TableColumn

  include Phlex::Rails::Helpers::Routes

  attr_reader :label

  def initialize(label:, value_from_item:, html_options:)
    @label = label
    @value_from_item = value_from_item
    @html_options = html_options
  end

  def value(item)
    case @value_from_item
    when String, Symbol
      return item[@value_from_item] if item.kind_of?(Hash)

      item.send(@value_from_item)
    # we should check it's callable really
    else
      @value_from_item.call(item)
    end
  end

  def header_html_options
    @html_options[:column_header]
  end

end
