class Spree::FeaturedProduct < ActiveRecord::Base
  belongs_to :product
  delegate :images, to: :product
  delegate :name, to: :product
end