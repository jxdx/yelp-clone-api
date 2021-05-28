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

      t.timestamps
    end

    # add index in order to use business_id and user_id as a foreign keys
    add_index :reviews, [:business_id, :user_id, :review_id]
  end
end
