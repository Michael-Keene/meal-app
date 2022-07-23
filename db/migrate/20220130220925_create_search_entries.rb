# frozen_string_literal: true
class CreateSearchEntries < ActiveRecord::Migration[7.0]

  def change
    create_table :search_entries do |t|
      t.integer :searchable_id
      t.string :searchable_type
      t.string :searchable_name
      t.string :searchable_text

      t.timestamps
    end
  end

end
