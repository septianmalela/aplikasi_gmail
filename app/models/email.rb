class Email < ApplicationRecord

	belongs_to :user
	# extend FriendlyId
 #    friendly_id :subject, use: :slugged

	has_many :post_attachments
	has_many :email_users, dependent: :destroy, inverse_of: :email
	accepts_nested_attributes_for :email_users, reject_if: lambda {|attributes| attributes['recipients'].blank?}
 	accepts_nested_attributes_for :post_attachments
	accepts_nested_attributes_for :email_users, allow_destroy: true

 		  scope :sent, ->  { where(status: 'sent') }
 		  scope :trash, -> { where(status: 'trash') }
     	  scope :draft, -> { where(status: 'draft') }
 		# scope :sent, -> { where(status: 'sent').or(where(status: 'trash')).or(where(status: 'delete')).order(id: :desc) }

end
