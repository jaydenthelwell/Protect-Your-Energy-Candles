Rails.application.routes.draw do
  resources :editions do
    get 'light', on: :collection
    get 'dark', on: :collection
  end
  resources :candles, only: [:index, :show]
  resources :line_items
  resources :payments, only: [:show, :index]
  resources :checkouts, only: [:show]

  resources :carts do
    post 'checkout', on: :member
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show] do
    resources :addresses, except: [:show] do
      post 'set_default', on: :member
    end
  end

  get 'users/new'

  get 'users/create'

  root to: 'home#index'

end
