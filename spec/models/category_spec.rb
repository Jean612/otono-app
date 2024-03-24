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
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:product_categories).dependent(:destroy) }
    it { should have_many(:products).through(:product_categories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
  end

  # describe '.search' do
  #   let!(:category1) { create(:category, name: 'Category 1') }
  #   let!(:category2) { create(:category, name: 'Category 2') }

  #   context 'when search term is present' do
  #     it 'returns categories matching the search term' do
  #       expect(Category.search('Category 1')).to eq([category1])
  #     end
  #   end

  #   context 'when search term is not present' do
  #     it 'returns all categories' do
  #       expect(Category.search(nil)).to eq([category1, category2])
  #     end
  #   end
  # end
end
