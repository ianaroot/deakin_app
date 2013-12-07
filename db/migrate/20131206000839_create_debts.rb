class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.float :amount
      t.integer :owed_from_id
      t.integer :owed_to_id

      t.timestamps
    end
  end
end
