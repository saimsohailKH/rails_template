module Admin
  class ProductsController < Admin::ApplicationController
    def index
      @products = Product.find_each
    end
  end
end
