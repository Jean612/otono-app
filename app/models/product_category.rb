# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  product_id  :uuid             not null
#
# Indexes
#
#  index_product_categories_on_category_id  (category_id)
#  index_product_categories_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_005b71ca83  (category_id => categories.id)
#  fk_rails_98a9a32a41  (product_id => products.id)
#
class ProductCategory < ApplicationRecord
  belongs_to :category
  belongs_to :product

  validates :category_id, uniqueness: { scope: :product_id }
end
