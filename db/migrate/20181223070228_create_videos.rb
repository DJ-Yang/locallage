class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :locallage
      t.string :university
      t.string :grade
      t.string :name
      t.string :video_url
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
