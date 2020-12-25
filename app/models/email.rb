class Email < ApplicationRecord
	belongs_to :user
	extend FriendlyId
    friendly_id :subject, use: :slugged

	has_many :post_attachments
 	accepts_nested_attributes_for :post_attachments
end
