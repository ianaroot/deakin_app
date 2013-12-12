class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer     :amount
      t.date        :date
      t.belongs_to  :user

      t.timestamps
    end
  end
end
