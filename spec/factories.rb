FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "some#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :video do
    title {"Video Title"}
    duration {3600}
    youtube_id {"v7AYKMP6rOE"}
    association :user
  end
end
