require 'rails_helper'

RSpec.feature "Users", type: :feature do
  background do
    @user = FactoryBot.create(:user)
  end

  scenario "user signs up" do
    user_new = FactoryBot.build(:user)

    visit "/login"
    click_link "新規登録"
    fill_in "メールアドレス", with: user_new.email
    fill_in "パスワード", with: user_new.password
    fill_in "パスワード(確認)", with: user_new.password
    click_button "登録する"

    expect(page).to have_content "ユーザーを登録しました。"
    expect(page).to have_current_path "/login"
  end

  scenario "user logins" do
    visit "/login"
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログインする"
    
    expect(page).to have_content "ログインしました。"
    expect(page).to have_current_path "/"
  end

  scenario "user logouts" do
    visit "/login"
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログインする"

    click_link "ログアウト"

    expect(page).to have_content "ログアウトしました。"
    expect(page).to have_current_path "/login"
  end

end
