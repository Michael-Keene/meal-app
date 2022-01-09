class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.float :fat
      t.float :carbs
      t.float :fibre
      t.float :protein
      t.float :calories
      t.string :name

      t.timestamps
    end
  end
end
