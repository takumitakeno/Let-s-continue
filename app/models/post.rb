class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  attachment :training_image
  acts_as_taggable
  belongs_to :user
  has_many :post_messages, dependent: :destroy
  has_many :goods, dependent: :destroy
  validates :post, presence: true,
                    length: { maximum: 255 }

  def gooded_by?(user)
    goods.where(user_id: user.id).exists?
  end
end
