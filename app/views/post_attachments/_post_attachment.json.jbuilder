json.extract! post_attachment, :id, :email_id, :attachment, :created_at, :updated_at
json.url post_attachment_url(post_attachment, format: :json)
