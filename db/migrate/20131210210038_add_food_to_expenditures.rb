class AddFoodToExpenditures < ActiveRecord::Migration
  def change
    add_column :expenditures, :food, :boolean
    add_index :expenditures, :food
  end
end
