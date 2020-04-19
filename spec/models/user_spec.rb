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

  describe "会員情報編集" do
    context "バリデーション" do
      it "名前が空で更新できない" do 
        expect(FactoryBot.build(:user, user_name: nil )).to_not be_valid
      end

      it "user_nameが空のまま編集するとエラ〜メッセージが表示される" do
        user = User.new()
        user.valid?
        expect(user.errors.messages[:user_name]).to include('を入力してください')
      end
    
      it "自己紹介文は５０文字以上では登録できない" do
        expect(FactoryBot.build(:user, introduction: "t" * 51 )).to_not be_valid
      end
    end
    context "バリデーションなし項目" do
      it "プロフィール画像はなくても更新できる" do 
        expect(FactoryBot.build(:user, profile_image_id: nil )).to be_valid
      end

      it "自己紹介文はなくても更新できる" do
        expect(FactoryBot.build(:user, introduction: nil )).to be_valid
      end
    end
  end

  describe "アソシエーション" do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'PostMessageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_messages).macro).to eq :has_many
      end                                   
    end

    context 'Goodモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:goods).macro).to eq :has_many
      end                                   
    end

    context 'TrainingRecordモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:training_records).macro).to eq :has_many
      end                                   
    end

    context 'Relationshipモデルとの関係' do
      it 'active_relationshipsと1:Nとなっている' do
        expect(User.reflect_on_association(:active_relationships).macro).to eq :has_many
      end  
      
      it 'passive_relationshipsと1:Nとなっている' do
        expect(User.reflect_on_association(:passive_relationships).macro).to eq :has_many
      end

      it 'followingsと1:Nとなっている' do
        expect(User.reflect_on_association(:followings).macro).to eq :has_many
      end

      it 'followersと1:Nとなっている' do
        expect(User.reflect_on_association(:followers).macro).to eq :has_many
      end
    end

    context 'UserRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:user_rooms).macro).to eq :has_many
      end
    end

    context 'Roomモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end

    context 'SnsCredentialsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:sns_credentials).macro).to eq :has_many
      end
    end
  end

  describe "belongs_toのによるdestroy"  do
    context "userモデルとの関係" do
      it "userモデルが削除されるとpostが削除される" do
          user = FactoryBot.create(:user, user_name: "test")
          user.posts.create(post: 'テスト投稿です')
          expect{ user.destroy }.to change{ Post.count }.by(-1)
      end
    end
  end
end
