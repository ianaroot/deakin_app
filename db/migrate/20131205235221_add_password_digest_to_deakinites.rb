class AddPasswordDigestToDeakinites < ActiveRecord::Migration
  def change
    add_column :deakinites, :password_digest, :string
  end
end
