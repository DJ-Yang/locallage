class CreateDesignAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :design_attachments do |t|
      t.string :portfolio
      t.integer :design_id

      t.timestamps
    end
  end
end
