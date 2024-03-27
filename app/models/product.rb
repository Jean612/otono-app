# frozen_string_literal: true

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
class Product < ApplicationRecord
  include(PgSearch::Model)

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true
  validates :image_path, presence: true

  scope :in_stock, -> { where('stock > 0') }
  scope :featured, -> { in_stock.order('RANDOM()').limit(10) }
  scope :by_category, ->(category) { joins(:categories).where(categories: { slug: category }) }

  # PgSearch scopes
  pg_search_scope :search_by_name_and_description, against: %i[name description],
                                                   ignoring: :accents,
                                                   associated_against: { categories: %i[name slug] },
                                                   using: { tsearch: {
                                                     prefix: true,
                                                     dictionary: 'english', # change to spanish in a future
                                                     any_word: true
                                                   } }
end
