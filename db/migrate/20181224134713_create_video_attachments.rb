class CreateVideoAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :video_attachments do |t|
      t.string :portfolio
      t.integer :video_id

      t.timestamps
    end
  end
end
