require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "user signs up and logins" do
    user = FactoryBot.build(:user)

    visit "/login"
    click_link "新規登録"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "パスワード(確認)", with: user.password
    click_button "登録する"

    expect(page).to have_content "ユーザーを登録しました。"
    expect(page).to have_current_path "/login"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    
    expect(page).to have_content "ログインしました。"
    expect(page).to have_current_path "/"
  end

  
end
