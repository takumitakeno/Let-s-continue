class TrainingRecord < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	belongs_to :user
	belongs_to :training_menu
	validates :weight, presence: true
	validates :rep, presence: true
end
