FactoryBot.define do
  factory :dairy do
    title "test"
    content "Diary is correct. Dairy is incorrect!!!"
    published true
    drafted false
    association :user
  end
end
