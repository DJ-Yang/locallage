class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :locallage
      t.text :content
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
