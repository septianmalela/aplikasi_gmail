class CreatePostAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_attachments do |t|
      t.integer :email_id
      t.string :attachment

      t.timestamps
    end
  end
end
