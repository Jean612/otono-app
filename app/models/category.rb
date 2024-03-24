# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, presence: true
  validates :slug, presence: true

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end
end
