FactoryBot.define do
  factory :article do
    title {Faker::Games::Pokemon.name}
    content {Faker::Games::Pokemon.location}
  end
end