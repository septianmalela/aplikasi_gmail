class Email < ApplicationRecord

	belongs_to :user
	extend FriendlyId
    friendly_id :subject, use: :slugged

	has_many :post_attachments
	has_many :email_users, dependent: :destroy
 	accepts_nested_attributes_for :post_attachments
	accepts_nested_attributes_for :email_users

 		scope :draft, -> { where(status: 'draft').order(id: :desc) }
 		scope :inbox, -> { where(status: 'sent').order(id: :desc) }
 		scope :trash, -> { where(status: 'trash').order(id: :desc) }
 		scope :sent, -> { where(status: 'sent').or(where(status: 'trash')).or(where(status: 'delete')).order(id: :desc) }

end
