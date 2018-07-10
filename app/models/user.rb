class User < ApplicationRecord
	mount_uploader :image, PhotoUploader

  #comment
  has_many :comments ,dependent: :restrict_with_error
	has_many :restaurants, through: :comments

  #favorite
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  #like
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  #followship
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

	validates_presence_of :name
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
  	self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

end
