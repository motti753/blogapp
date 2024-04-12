FactoryBot.define do
  factory :comment do
    content {Faker::Games::Pokemon.move}
  end
end