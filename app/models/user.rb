class User < ApplicationRecord
	mount_uploader :image, PhotoUploader
	has_many :comments
	validates_presence_of :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
  	self.role == "admin"
  end

end
