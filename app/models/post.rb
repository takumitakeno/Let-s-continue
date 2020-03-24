class Post < ApplicationRecord
	attachment :training_image
	belongs_to :user
	has_many :post_messages, dependent: :destroy
	has_many :goods, dependent: :destroy
	validates :post, presence: true

	def gooded_by?(user)
      goods.where(user_id: user.id).exists?
    end
end
