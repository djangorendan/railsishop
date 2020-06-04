Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :orders, except: [:show, :destroy] do
    get :cancel
  end

  resources :products, only: :show do
    get :create_product_comment
    get :like_comment
    get :dislike_comment
  end

  resources :categories, only: :show

  resources :carts do
    collection do
      get :product_to_cart
      get :delete_product_from_cart
    end
  end

  namespace :admin do
    resources :product_photos
    resources :categories, except: :show
    resources :properties do
      collection do
        get :set_position
      end
    end
    resources :products, except: :show
    resources :orders, only: [:index, :edit, :update] do
      get :cancel
    end
    resources :users
    resources :carousel_images
    resources :app_images
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#main'

  get 'results', to: 'results#index', as: 'results'

  get '/admin' => 'admin/orders#index'

  get '/about_us', to: 'etc#about_us'
  get '/delivery', to: 'etc#delivery'
  get '/payments', to: 'etc#payments'
  get '/contacts', to: 'etc#contacts'
end
