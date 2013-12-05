class CreateDeakinites < ActiveRecord::Migration
  def change
    create_table :deakinites do |t|
      t.string :name
      t.string :email
      t.boolean :eats_house_food

      t.timestamps
    end
  end
end
