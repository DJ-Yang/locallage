class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :title
      t.string :locallage
      t.text :content
      t.string :price

      t.timestamps
    end
  end
end
