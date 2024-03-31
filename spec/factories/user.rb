FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Prakash #{n}" }
    sequence(:email) { |n| "prakash#{n}@gmail.com"}
    password { "123456" }
    password_confirmation { "123456" }
  end
end
