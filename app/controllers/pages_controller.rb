class PagesController < ApplicationController
  def home
    @featured = Product.featured
    @women_products = Product.by_category('women')
    @men_products = Product.by_category('men')
  end
end
