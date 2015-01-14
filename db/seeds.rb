require 'faker'

categories_names = []

20.times do
  categories_names << Faker::Commerce.department
end

categories_names.uniq!

5.times do
  Category.create(title: categories_names.shift)
end

5.times do
  Article.create(title: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, email: Faker::Internet.email, price: Faker::Commerce.price, category_id: 1)
end

5.times do
  Article.create(title: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, email: Faker::Internet.email, price: Faker::Commerce.price, category_id: 2)
end

5.times do
  Article.create(title: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, email: Faker::Internet.email, price: Faker::Commerce.price, category_id: 3)
end

5.times do
  Article.create(title: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, email: Faker::Internet.email, price: Faker::Commerce.price, category_id: 4)
end

5.times do
  Article.create(title: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, email: Faker::Internet.email, price: Faker::Commerce.price, category_id: 5)
end
