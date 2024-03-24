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
end
