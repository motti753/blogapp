# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
suzuran = User.create!(email: 'suzuran@gmail.com', password: 'password')
tester = User.create!(email: 'tester@gmail.com', password: 'password')

5.times do
  suzuran.articles.create!(
    title: Faker::Games::Pokemon.name,
    content: Faker::Games::Pokemon.location
  )
end

5.times do
  tester.articles.create!(
    title: Faker::Games::Pokemon.name,
    content: Faker::Games::Pokemon.location
  )
end
