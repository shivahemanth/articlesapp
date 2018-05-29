class Article < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  belongs_to :user
  has_many :comments
end
