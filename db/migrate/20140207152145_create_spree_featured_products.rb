class CreateSpreeFeaturedProducts < ActiveRecord::Migration
  def change
    create_table :spree_featured_products do |t|
      t.belongs_to :product, index: true
      t.string :name

      t.timestamps
    end
  end
end
