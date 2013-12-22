class AddRentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rent, :integer
  end
end
