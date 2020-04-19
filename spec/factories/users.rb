FactoryBot.define do
  factory :user do
    user_name              {"test"}
    # emailは重複すると登録できない
    sequence(:email) { |n| "test#{n}@example.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
    admin                 {"false"}
  end
end
