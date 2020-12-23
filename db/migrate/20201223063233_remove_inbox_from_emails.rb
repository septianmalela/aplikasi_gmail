class RemoveInboxFromEmails < ActiveRecord::Migration[6.1]
  def change
    remove_column :emails, :inbox, :string
  end
end
