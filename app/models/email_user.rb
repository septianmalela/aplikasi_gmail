class EmailUser < ApplicationRecord
	belongs_to :email

	# extend FriendlyId
    # friendly_id :subject, use: :slugged

	default_scope { order(id: :desc) }

 	scope :inbox, -> { where(status: 'inbox') }
 	scope :trash, -> { where(status: 'trash') }

end
