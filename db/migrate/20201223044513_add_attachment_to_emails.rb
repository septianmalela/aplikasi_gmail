class AddAttachmentToEmails < ActiveRecord::Migration[6.1]
  def change
    add_column :emails, :attachment, :json
  end
end
