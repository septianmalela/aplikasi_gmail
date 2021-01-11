class AddSlugToEmailUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :email_users, :slug, :string
  end
end
