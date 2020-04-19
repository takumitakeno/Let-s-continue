FactoryBot.define do
  factory :post do
    post{"test"}
    association :user
  end
end
