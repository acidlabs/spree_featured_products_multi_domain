module Spree
  HomeController.class_eval do
    before_action :set_featured_products, only: :landing

    private

    def set_featured_products
      @featured_products = Spree::FeaturedProduct.all
    end
  end
end