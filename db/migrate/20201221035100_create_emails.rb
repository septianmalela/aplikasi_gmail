class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :recipients
      t.string :subject
      t.text :message
      t.string :inbox
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
