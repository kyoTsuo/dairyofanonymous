require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "user signs up and logins" do
    visit "/login"
    click_link "新規登録"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "TestPassword"
    fill_in "パスワード(確認)", with: "TestPassword"
    click_button "登録する"

    expect {
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "TestPassword"
      click_button "ログインする"

      expect(page).to have_content "ログインしました。"
      expect(page).to have_content "日記一覧"
      expect(page).to have_current_path "/"
    }.to 
    
  end
end
