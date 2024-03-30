# FactoryBot factory definition
FactoryBot.define do
  factory :user do
    name { "Prakash" }
    email { "prakash@gmail.com" }
    password { "123456" }
    password_confirmation {"123456"}
  end
end
