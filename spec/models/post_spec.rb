require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "投稿テスト" do
    context "バリデーション" do 
      it "投稿が空の場合は投稿できない" do
        expect(FactoryBot.build(:post, post: nil )).to_not be_valid
      end

      it "投稿が255文字以上だと投稿できない" do
        expect(FactoryBot.build(:post, post: "a" * 256 )).to_not be_valid
      end

      it "user_idがnilの場合は投稿できない" do
        expect(FactoryBot.build(:post, user_id: nil)).to_not be_valid
      end
    end

    context "バリデーションメッセージ" do 
      it "投稿が空だとメッセージが表示される" do
        post = Post.new()
        post.valid?
        expect(post.errors.messages[:post]).to include('を入力してください')
      end
    end

    context "バリデーションなし項目" do
      it "画像がなくても投稿できる" do
        expect(FactoryBot.build(:post, training_image_id: nil )).to be_valid
      end
    end
  end 

  describe "アソシエーション" do
    context "userモデルとの関係" do 
      it "N対１の関係になっている" do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "post_messsagesモデルとの関係" do 
      it "1対Nの関係になっている" do
        expect(Post.reflect_on_association(:post_messages).macro).to eq :has_many
      end
    end

    context "goodsモデルとの関係" do 
      it "1対Nの関係になっている" do
        expect(Post.reflect_on_association(:goods).macro).to eq :has_many
      end
    end
  end
end

