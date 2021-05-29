class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :review_id
      t.string :user_id
      t.string :business_id
      t.float :stars
      t.integer :useful
      t.integer :funny
      t.integer :cool
      t.string :text
      t.string :date
      t.references :restaurant, type: :string
      t.references :user, type: :string

      t.timestamps
    end
    # search reviews by business_id
    add_index :reviews, :business_id
    # A user can only revew a restaurant once
    add_index :reviews, [:business_id, :review_id, :user_id], unique: true
  end
end
