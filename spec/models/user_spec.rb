require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a email, and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")  
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "test@example.co.jp")

    user = FactoryBot.build(:user, email: "test@example.co.jp")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  describe "has password" do
    context "when it is less than 8 characters" do
      it "is invalid with a password" do
        user = FactoryBot.build(:user, password: "1234567")
        user.valid?
        expect(user.errors[:password]).to include("は8文字以上で入力してください")  
      end
    end

    context "when it is 8 characters" do
      it "is valid with a password" do
        user = FactoryBot.build(:user, password: "12345678")
        expect(user).to be_valid  
      end
    end

    context "when it is more than 8 characters" do
      it "is valid with a password" do
        user = FactoryBot.build(:user, password: "123456789")
        expect(user).to be_valid
      end
    end
  end
end
