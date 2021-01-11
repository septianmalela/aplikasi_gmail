class EmailUser < ApplicationRecord
	belongs_to :email

	belongs_to :user

	# extend FriendlyId
    # friendly_id :subject, use: :slugged

 	default_scope { order(created_at: :desc) }
 	scope :inbox, ->  { where(status: 'inbox') }
 	scope :trash, ->  { where(status: 'trash') }

 	# def inbox
		# where(status: 'inbox')
 	# end

end
