class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :owed_from
      t.string :owed_to

      t.timestamps
    end
  end
end
