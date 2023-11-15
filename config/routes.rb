Rails.application.routes.draw do
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :candles, only: [:index, :show]

  resources :editions do
    get 'light', on: :collection
    get 'dark', on: :collection

  end

  # Defines the root path route ("/")
  # root "articles#index"
end
