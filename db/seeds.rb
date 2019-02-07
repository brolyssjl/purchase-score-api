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
    purchase_id: Faker::Number.between(1, 10),
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
end

5.times do
  PurchaseScore.create(
    score: Faker::Number.between(1, 5),
    description: Faker::Lorem.paragraph,
    deleted: Faker::Boolean.boolean(0.5),
    user_id: 12,
    shop_id: Faker::Number.between(1, 10),
    purchase_id: Faker::Number.between(11, 20),
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
end

5.times do
  PurchaseScore.create(
    score: Faker::Number.between(1, 5),
    description: Faker::Lorem.paragraph,
    deleted: Faker::Boolean.boolean(0.5),
    user_id: Faker::Number.between(1, 10),
    shop_id: 13,
    purchase_id: Faker::Number.between(21, 30),
    created_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
end
