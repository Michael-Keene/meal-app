# frozen_string_literal: true
class TableComponent < ApplicationComponent

  def initialize(turbo_stream_rows_from: nil, html_options: {}, row_id: ->(item) { {id: item.dom_id} })
    @html_options = default_html_options.tap do |options|
      html_options.each do |k, v|
        options[k] = options.fetch(k, {}).merge(v)
      end
    end
    @turbo_stream_rows_from = turbo_stream_rows_from
    @items = []
    @columns = []
    @row_id = row_id
  end

  def template
    table(**@html_options[:table]) do
      thead(**@html_options[:thead]) {
        tr { header_row }
      }
      tbody(**@html_options[:tbody]) {
        turbo_stream_rows_tag if @turbo_stream_rows_from
        @items.each do |item|
          tr(**row_id(item), **@html_options[:tr]) { item_row(item) }
        end
      }
    end
  end

  def add_column(html_options: {}, **kwargs)
    column_html_options = default_column_html_options.tap do |options|
      html_options.each do |k,v|
        options[k] = options.fetch(k, {}).merge(v)
      end
    end
    @columns << TableColumn.new(**kwargs, html_options: column_html_options)
  end

  def with_items(items)
    @items = Array(items)
    self
  end

  private

  def row_id(item)
    @row_id.call(item)
  end

  def turbo_stream_rows_tag
    helpers.turbo_stream_from @turbo_stream_rows_from
  end

  def default_column_html_options
    @html_options.slice(:column_header)
  end

  def header_row
    @columns.each do |c|
      th(**@html_options[:column_header]) { c.label }
    end
  end

  def item_row(item)
    @columns.each do |c|
      td { c.value(item) }
    end
  end

  def default_html_options
    {
      table: {class: "table-auto w-full divide-y divide-gray-200"},
      thead: {class: "bg-gray-50"},
      column_header: {scope: "col", class: "text-left text-xs font-medium text-gray-500 uppercase"},
      tbody: {class: "bg-white divide-y divide-gray-200"},
      tr: {style: "height: 3.5rem;"}
    }.freeze
  end

end
