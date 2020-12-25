class AddSlugToEmails < ActiveRecord::Migration[6.1]
  def change
    add_column :emails, :slug, :string
    add_index :emails, :slug, unique: true
  end
end
