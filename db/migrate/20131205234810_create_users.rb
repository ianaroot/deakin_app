class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :eats_house_food, default: true

      t.timestamps
    end
  end
end
