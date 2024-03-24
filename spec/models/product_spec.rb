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
require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    # Validación de presencia
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:stock) }
    it { should validate_presence_of(:image_path) }
    it { should validate_presence_of(:description) }

    # Validación de formato de precio
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  context 'associations' do
    # Asociaciones
    it { should have_many(:product_categories) }
    it { should have_many(:categories).through(:product_categories) }
  end

  context 'scopes' do # rubocop:disable Metrics/BlockLength
    describe '.in_stock' do
      it 'returns products with stock greater than 0' do
        product1 = create(:product, stock: 0)
        product2 = create(:product, stock: 5)

        expect(Product.in_stock).to include(product2)
        expect(Product.in_stock).not_to include(product1)
      end
    end

    describe '.featured' do
      it 'returns 20 random products in stock' do
        Product.destroy_all
        featured_products = create_list(:product, 20, stock: 5)

        result = Product.featured

        expect(result.count).to eq(20)
        expect(result.ids).to match_array(featured_products.map(&:id))
      end
    end

    describe '.by_category' do
      it 'returns products belonging to the specified category' do
        category = create(:category)
        product1 = create(:product)
        product2 = create(:product)
        product1.categories << category

        expect(Product.by_category(category.slug)).to include(product1)
        expect(Product.by_category(category.slug)).not_to include(product2)
      end
    end
  end
end
