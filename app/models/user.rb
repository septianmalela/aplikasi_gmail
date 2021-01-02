class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	
  extend FriendlyId
  friendly_id :name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :avatar, presence: true
  has_many :emails

      default_scope { order({id: :desc}, :created_at) }
      scope :draft, -> { where(status: 'draft') }
      scope :inbox, -> { where(status: 'sent') }
      scope :trash, -> { where(status: 'trash') }
      scope :sent, -> { where(status: 'sent').or(where(status: 'trash')).or(where(status: 'delete')) }

end
