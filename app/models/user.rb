class User < ApplicationRecord
	validates :first_name,  presence: true
	validates :last_name,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

#validates :password, length: { minimum: 6 }

has_secure_password     

mount_uploaders :avatars, AvatarUploader
#serialize :avatars, JSON

has_many :comments

has_many :umetas, class_name: "UserMetum"

accepts_nested_attributes_for :umetas


def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end               

end
