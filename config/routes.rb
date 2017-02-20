Rails.application.routes.draw do
  root "pages#home"

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace 'admin' do
    resources :users, only: [:index]
  end

  resources :users, only: [:new, :create, :show] do
    resources :tanks, only: [:new, :create, :show]
  end

  resources :tanks, only: [:show] do
    resources :fish
    resources :tank_features, only: [:create, :new, :show]
  end

  resources :breeds, only: [:create, :new, :show]
end
