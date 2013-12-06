class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.integer :owed_from_id
      t.integer :owed_to_id

      t.timestamps
    end
  end
end
