require 'rails_helper'

RSpec.feature "Dairies", type: :feature do
  background do
    @user = FactoryBot.create(:user)
    @dairy = FactoryBot.create(:dairy, user_id: @user.id)

    visit "/login"
    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    click_button "ログインする"

  end

  scenario "user makes a dairy" do
    dairy_new = FactoryBot.build(:dairy, title: "test_new", content: "HelloWorld!!!")
    click_link "新規登録"
    fill_in "題名", with: dairy_new.title
    fill_in "内容", with: dairy_new.content
    choose "公開"
    uncheck "下書き"
    click_button "投稿する"

    expect(page).to have_content "日記#{dairy_new.title}を投稿しました。"
    expect(page).to have_current_path "/dairies"
  end

  scenario "user edit a dairy" do
    click_link "#{@dairy.title}"
    click_link "編集"
    @new_title = "test_edit"
    fill_in "題名", with: @new_title
    click_button "更新する"

    expect(page).to have_content "日記#{@new_title}を更新しました。"
    expect(page).to have_current_path "/dairies"
  end

  scenario "user delete a dairy" do
    click_link "#{@dairy.title}"
    click_link "削除"
    expect(page).to have_content "日記#{@dairy.title}を削除しました。"
  end
end
