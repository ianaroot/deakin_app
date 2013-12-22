class AddPrimaryRentPayerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :primary_rent_payer, :boolean
  end
end
