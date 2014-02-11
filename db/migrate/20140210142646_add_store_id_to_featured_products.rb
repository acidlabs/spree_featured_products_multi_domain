class AddStoreIdToFeaturedProducts < ActiveRecord::Migration
  def change
    add_reference :spree_featured_products, :store, index: true
  end
end
