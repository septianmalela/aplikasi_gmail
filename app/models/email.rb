class Email < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	belongs_to :user
end
