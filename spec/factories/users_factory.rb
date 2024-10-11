FactoryBot.define do
  factory :user do
    email_address { "someone@example.com" }

    password { "password" }
    password_confirmation { "password" }
  end
end
