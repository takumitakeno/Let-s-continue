class Post < ApplicationRecord
	belongs_to :user
	validates :posts, presence: true
end
