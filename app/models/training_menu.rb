class TrainingMenu < ApplicationRecord
	has_many :training_records, dependent: :destroy
end
