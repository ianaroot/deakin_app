class AddFoodToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :food, :boolean
    add_index :expenses, :food
  end
end
