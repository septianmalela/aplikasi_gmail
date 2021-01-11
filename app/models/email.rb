class Email < ApplicationRecord

	belongs_to :user
	# extend FriendlyId
 #    friendly_id :subject, use: :slugged

	has_many :post_attachments
	has_many :email_users

	accepts_nested_attributes_for :email_users, reject_if: lambda {|attributes| attributes['recipients'].blank?}
 	accepts_nested_attributes_for :post_attachments
	accepts_nested_attributes_for :email_users, allow_destroy: true

 	after_create :generate_email_users
 	after_update :generate_email_users_update
 	attr_accessor :generate_email_errors

	default_scope { order(updated_at: :desc) }
 	scope :sent, ->  { where(status: 'sent') }
 	scope :draft, ->  { where(status: 'draft') }
 	scope :trash, ->  { where(status: 'trash') }

 	def self.gabungan
	  trash + EmailUser.trash
	end

	# def self.sent
	# 	where(status: 'sent')
 # 	end

 # 	def self.draft
 # 		where(status: 'draft')
 # 	end

 	# def self.trash
 	# 	[] << where(status: 'trash') << EmailUser.where(status: 'trash')
 	# end

 	begin
	 	def generate_email_users
	 		recipients.split(", ").each do |recipient|
	 			email_users.create(
	 				user_id: User.find_by(email: recipient).id,
	 				subject: subject
	 			)
	 		end
	 	end
 	rescue  => e
 		print e
 	end

 	def generate_email_users_update
 		recipients.split(", ").each do |recipient|
 			email_users.create(
 				user_id: User.find_by(email: recipient).id,
 				subject: subject,
 				status: 'inbox'
 			)
 		end
 	end

end
