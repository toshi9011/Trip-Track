class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
