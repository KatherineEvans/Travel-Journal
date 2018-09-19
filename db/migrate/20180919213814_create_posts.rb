class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :photo
      t.string :description
      t.string :location
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
