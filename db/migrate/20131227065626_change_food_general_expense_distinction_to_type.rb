class ChangeFoodGeneralExpenseDistinctionToType < ActiveRecord::Migration
  def up
    add_column :expenses, :type, :string
    Expense.all.each do |exp|
      if exp.food == true
        exp.type = "food"
        exp.save!
      elsif exp.food == false 
        exp.type = "general"
        exp.save!
      end
    end
    remove_column :expenses, :food
  end

  def down
    add_column :expenses, :food, :boolean
    Expense.all.each do |exp|
      if exp.type == "food"
        exp.food = true
        exp.save!
      elsif exp.type == "general"
        exp.food = false
        exp.save!
      end
    end
    remove_column :expenses, :type
  end
end
