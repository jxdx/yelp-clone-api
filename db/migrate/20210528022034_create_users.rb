class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :user_id
      t.integer :useful
      t.float :average_stars

      t.timestamps
    end
  end
end
