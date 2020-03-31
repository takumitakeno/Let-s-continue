class PostMessage < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates :post_message, presence: true
	validates :user_id, presence:true
end
