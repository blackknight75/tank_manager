Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :tanks, only: [:new, :create, :show]
  end
end
