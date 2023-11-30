Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'users/new'

  get 'users/create'

  resources :users, only: [:show] do
    resources :addresses, except: [:show] do
      post 'set_default', on: :member
    end
  end

  # resources :orders, only: [:new, :create, :show]

  # resources :line_items do
  #   member do
  #     post 'add_quantity'
  #     post 'reduce_quantity'
  #   end
  # # end

  # resource :cart, only: [:show] do
  #   post 'checkout', on: :member
  # end

  root to: 'home#index'

  resources :candles, only: [:index, :show]

  resources :editions do
    get 'light', on: :collection
    get 'dark', on: :collection
  end
end
