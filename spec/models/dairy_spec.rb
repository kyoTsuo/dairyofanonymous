require 'rails_helper'

RSpec.describe Dairy, type: :model do

  it "is valid with a content and user" do
    expect(FactoryBot.build(:dairy)).to be_valid
  end

  it "is invalid without a content" do
    dairy = FactoryBot.build(:dairy, content: nil)
    dairy.valid?
    expect(dairy.errors[:content]).to include("を入力してください")
  end

  it "is invalid without a user" do
    dairy = FactoryBot.build(:dairy, user: nil)
    dairy.valid?
    expect(dairy.errors[:user]).to include("を入力してください")
  end

end
