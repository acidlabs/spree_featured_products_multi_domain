class AddStoreIdToFeaturedProducts < ActiveRecord::Migration
  def change
    add_reference :featured_products, :store, index: true
  end
end
