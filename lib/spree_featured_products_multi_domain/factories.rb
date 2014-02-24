FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_featured_products/factories'

  factory :store, :class => Spree::Store do
    name 'My store'
    code 'my_store'
    domains 'www.example.com' # makes life simple, this is the default
    # integration session domain
  end
end
