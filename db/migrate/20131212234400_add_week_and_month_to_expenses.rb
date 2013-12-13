class AddWeekAndMonthToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :week, :integer
    add_column :expenses, :month, :integer
  end
end
