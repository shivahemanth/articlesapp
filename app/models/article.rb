class Article < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, JSON
  belongs_to :user
  has_many :comments
end
