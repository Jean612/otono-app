# == Schema Information
#
# Table name: products
#
#  id          :uuid             not null, primary key
#  description :text             not null
#  image_path  :string           not null
#  name        :string           not null
#  price       :decimal(10, 2)   not null
#  stock       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_description  (description)
#  index_products_on_name         (name)
#
FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { "9.99" }
    stock { 1 }
    image_path { "MyString" }
    description { "MyText" }
  end
end
