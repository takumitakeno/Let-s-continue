class Post < ApplicationRecord
	attachment :training_image
	belongs_to :user
	has_many :post_messages, dependent: :destroy
	validates :post, presence: true
end
