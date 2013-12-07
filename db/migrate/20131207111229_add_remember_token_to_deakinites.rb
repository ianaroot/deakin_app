class AddRememberTokenToDeakinites < ActiveRecord::Migration
  def change
    add_column :deakinites, :remember_token, :string
    add_index :deakinites, :remember_token
  end
end
