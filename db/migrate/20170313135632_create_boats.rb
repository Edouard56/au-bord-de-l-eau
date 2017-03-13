class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :price_per_day
      t.integer :nb_of_passengers

      t.timestamps
    end
  end
end
