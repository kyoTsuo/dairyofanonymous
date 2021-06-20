require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it "is valid with an user and dairy" do
    expect(FactoryBot.build(:favorite)).to be_valid
  end

  it "is invalid without an user" do
    favorite = FactoryBot.build(:favorite, user: nil)
    favorite.valid?
    expect(favorite.errors[:user]).to include("を入力してください")
  end

  it "is invalid without a dairy" do
    favorite = FactoryBot.build(:favorite, dairy: nil)
    favorite.valid?
    expect(favorite.errors[:dairy]).to include("を入力してください")
  end
end
