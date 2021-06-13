require 'rails_helper'

RSpec.describe User, type: :model do

  # メールとパスワードがあれば有効な状態であること
  it "is valid with a email, and password" do
    user = User.new(
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    expect(user).to be_valid
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user_has_no_email = User.new(
      email: nil,
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    user_has_no_email.valid?
    expect(user_has_no_email.errors[:email]).to include("を入力してください")  
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )

    user_has_duplicate_email = User.new(
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    user_has_duplicate_email.valid?
    expect(user_has_duplicate_email.errors[:email]).to include("はすでに存在します")
  end

  # パスワードが入力されている
  describe "has password" do
    # 8文字未満の場合
    context "when it is less than 8 characters" do
      it "is invalid with a password" do
        user = User.new(
          email: "tester@example.com",
          password: "1234567"
        )
        user.valid?
        expect(user.errors[:password]).to include("は8文字以上で入力してください")  
      end
    end

    # 8文字の場合
    context "when it is 8 characters" do
      it "is valid with a password" do
        user = User.new(
          email: "tester@example.com",
          password: "12345678"
        )
        expect(user).to be_valid  
      end
    end

    # 8文字以上の場合
    context "when it is more than 8 characters" do
      it "is valid with a password" do
        user = User.new(
          email: "tester@example.com",
          password: "123456789"
        )
        expect(user).to be_valid
      end
    end
  end
end
