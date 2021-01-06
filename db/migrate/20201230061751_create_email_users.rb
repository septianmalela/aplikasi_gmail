class CreateEmailUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :email_users do |t|
      t.integer :email_id
      t.string :recipients
      t.boolean :read, default: false
      t.string :status, default: 'inbox'

      t.timestamps
    end
  end
end
