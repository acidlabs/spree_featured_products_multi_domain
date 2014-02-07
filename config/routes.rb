Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :featured_products
  end
end