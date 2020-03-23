class Post < ApplicationRecord
	attachment :training_image
	belongs_to :user
	validates :posts, presence: true
end
