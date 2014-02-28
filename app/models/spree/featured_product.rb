class Spree::FeaturedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :store
  delegate :images, to: :product
  delegate :name, to: :product
  delegate :name, to: :store, prefix: true

  scope :by_store, lambda { |store_id| where(store_id: store_id ) }
  
  scope :by_taxonomy, lambda { |name| joins(product: [taxons: :taxonomy]).where(spree_taxonomies: {name: name}) }
end
