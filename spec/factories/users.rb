FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'password'}

    trait :with_profile do
      # userがcreateされたときに、profileもcreateする
      # profileはfactories/profile.rbをもとに作成する
      after :build do |user|
        build(:profile, user: user)
      end
    end
  end
end
