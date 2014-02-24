class Spree::FeaturedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :store
  delegate :images, to: :product
  delegate :name, to: :product
  delegate :name, to: :store, prefix: true

  scope :by_store, -> (store_id) { where(store_id: store_id ) }

  validates :store_id, presence: true

end