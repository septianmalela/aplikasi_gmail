class PostAttachment < ApplicationRecord

	mount_uploader :attachment, AvatarUploader
    belongs_to :email

end
