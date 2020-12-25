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


end
