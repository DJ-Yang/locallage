class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :title
      t.string :locallage
      t.string :university
      t.string :grade
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
