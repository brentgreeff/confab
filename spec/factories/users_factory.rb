FactoryBot.define do
  factory :user do
    sequence(:email_address) do |i|
      "someone.#{i.to_s.rjust(2, '0')}@example.com"
    end

    password { "password" }
    password_confirmation { "password" }
  end
end
