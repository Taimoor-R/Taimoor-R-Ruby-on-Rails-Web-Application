class MusicController < ApplicationController
  include CurrentCart # INCLUDED CURRENTCART HELPER MODULE TO SET CURRENT CART TO CURRENT USER_CART
  before_action :set_cart #SETS CART
  def index
    @products = Product.order(:title) # GETS PRODUCTS FILTERED BY THEIR TITLES 
  end
end
