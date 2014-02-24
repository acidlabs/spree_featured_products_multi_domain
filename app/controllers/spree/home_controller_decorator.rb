module Spree
  HomeController.class_eval do
    before_action :set_featured_products, only: :landing

    private

    def set_featured_products
      @featured_products = Spree::FeaturedProduct.by_store(current_store.id)
    end
  end
end