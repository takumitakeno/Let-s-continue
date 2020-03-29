# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  admin = false
  a = "今年は絶対に痩せます！（テスト）"
  User.create!(user_name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin,
               introduction: a
               )
end

User.create!(
   email: 'test@test',
   user_name: '管理者テスト',
   password: 'aaaaaa',
   password_confirmation: 'aaaaaa',
   admin: 'ture',
   introduction: 'はじめまして！管理者です'
)

50.times do |i|
  Post.create(user_id: User.find(i+1).id,
              post: "今日のトレーニングはベンチプレスとスクワット #{i+1}",
              )
end

TrainingMenu.create!(
  menu: "スクワット"
)

TrainingMenu.create!(
  menu: "ベンチプレス"
)

TrainingMenu.create!(
  menu: "デッドリフト"
)

TrainingMenu.create!(
  menu: "懸垂"
)

TrainingMenu.create!(
  menu: "アームカール"
)




