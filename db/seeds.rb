# frozen_string_literal: true

require 'faker'

# Crear categorías
categories = [
  { name: 'Polo', slug: 'polo' },
  { name: 'Pantalón', slug: 'pants' },
  { name: 'Hombre', slug: 'men' },
  { name: 'Mujer', slug: 'women' }
]

categories.each do |category|
  Category.find_or_create_by!(name: category[:name], slug: category[:slug])
end

# Crear productos
50.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 50..100),
    stock: Faker::Number.between(from: 10, to: 50),
    image_path: Faker::LoremFlickr.image
  )
  # Asignar categorías al producto
  product.product_categories.create!(category: Category.find_by(name: 'Polo'))
  product.product_categories.create!(category: Category.where(name: %w[Hombre Mujer]).sample)
end

50.times do
  product = Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 50..100),
    stock: Faker::Number.between(from: 10, to: 50),
    image_path: Faker::LoremFlickr.image
  )
  # Asignar categorías al producto
  product.product_categories.create!(category: Category.find_by(name: 'Pantalón'))
  product.product_categories.create!(category: Category.where(name: %w[Hombre Mujer]).sample)
end
