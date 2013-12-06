class AddIndexToDeakinitesEmail < ActiveRecord::Migration
  def change
    add_index :deakinites, :email, unique: true
  end
end
