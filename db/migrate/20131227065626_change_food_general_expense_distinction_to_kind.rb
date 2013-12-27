class ChangeFoodGeneralExpenseDistinctionToKind < ActiveRecord::Migration
  def up
    add_column :expenses, :kind, :string
    Expense.all.each do |exp|
      if exp.food == true
        exp.kind = "food"
        exp.save!
      elsif exp.food == false 
        exp.kind = "general"
        exp.save!
      end
    end
    remove_column :expenses, :food
  end

  def down
    add_column :expenses, :food, :boolean
    Expense.all.each do |exp|
      if exp.kind == "food"
        exp.food = true
        exp.save!
      elsif exp.kind == "general"
        exp.food = false
        exp.save!
      end
    end
    remove_column :expenses, :kind
  end
end
