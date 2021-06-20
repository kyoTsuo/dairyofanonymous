FactoryBot.define do
  factory :favorite do
    association :dairy
    association :user
  end
end
