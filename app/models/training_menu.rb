class TrainingMenu < ApplicationRecord
	has_many :training_records, dependent: :destroy
	validates :menu, presence: true
end
 