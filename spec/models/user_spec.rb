require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員登録' do
    it "名前がないと登録できない" do 
      expect(FactoryBot.build(:user, user_name: nil)).to_not be_valid
    end 
    it "emailがないと登録できない" do
      expect(FactoryBot.build(:user, email: nil)).to_not be_valid
    end

    it "emailは重複していると登録できない" do 
      user1 = FactoryBot.create(:user,user_name: "aaa", email: "aaa@example.com")
      expect(FactoryBot.build(:user, user_name: "bbb", email: user1.email)).to_not be_valid
    end

    it "パスワードがからの場合は登録できない" do 
      expect(FactoryBot.build(:user, password: nil)).to_not be_valid 
    end 

    it "パスワードは６文字以上でないと登録できない" do
      expect(FactoryBot.build(:user, password: "aaaaa")).to_not be_valid
    end
  end
end
