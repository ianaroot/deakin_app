class AddYearToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :year, :integer
  end
end
