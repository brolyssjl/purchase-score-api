# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  PurchaseScore.create(
    score: Faker::Number.between(1, 5),
    description: Faker::Lorem.paragraph,
    deleted: Faker::Boolean.boolean(0.5),
    user_id: Faker::Number.between(1, 10),
    shop_id: Faker::Number.between(1, 10),
    purchase_id: Faker::Number.between(1, 10)
  )
end
