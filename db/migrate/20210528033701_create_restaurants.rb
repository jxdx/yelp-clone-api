class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :business_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :latitude
      t.string :longitude
      t.float :stars
      t.integer :review_count
      t.integer :is_open
      t.json :restaurant_attributes
      t.json :hours

      t.timestamps
    end
    # search restaurants by business_id
    add_index :restaurants, :business_id
  end
end
