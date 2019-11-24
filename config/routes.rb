Rails.application.routes.draw do
  resources :orders do
    get :cancel
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :products, only: :show
  resources :categories, only: :show

  resources :carts do
    collection do
      get :product_to_cart
      get :delete_product_from_cart
      get :delete_all_products_from_cart
      get :apply_coupon
    end
  end

  namespace :admin do
    resources :categories, except: :show
    resources :properties
    resources :products, except: :show
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#main'
  get 'results', to: 'results#index', as: 'results'

  get '/admin' => 'admin/products#index'
end
