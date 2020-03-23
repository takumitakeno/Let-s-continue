class Post < ApplicationRecord
	attachment :training_image
	belongs_to :user
	validates :post, presence: true
end
