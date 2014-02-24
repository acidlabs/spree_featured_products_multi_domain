require 'spec_helper'

describe Spree::FeaturedProduct do
  it "should create a valid featured_product when created with valid params" do
    featured_product = Spree::FeaturedProduct.new
    featured_product.store = create(:store)

    featured_product.should be_valid
  end

  it "should not create a featured_product when created with invalid params" do
    featured_product = Spree::FeaturedProduct.new
    featured_product.product = build(:product)
    featured_product.should be_invalid
  end
end
