FactoryBot.define do
  factory :profile do
    nickname { Faker::Games::SuperMario.character }
    introduction { Faker::Games::SuperMario.location }
    gender { Profile.genders.keys.sample }
    birthday { Faker::Date.birthday(min_age: 20, max_age: 35) }
  end
end