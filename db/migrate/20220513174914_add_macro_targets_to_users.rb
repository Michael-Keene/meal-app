class AddMacroTargetsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fat, :float, default: 60.0
    add_column :users, :carbs, :float, default: 270.0
    add_column :users, :fibre, :float, default: 30.0
    add_column :users, :protein, :float, default: 90.0
    add_column :users, :calories, :float, default: 2000.0
  end
end
