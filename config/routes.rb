Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # scope :admins do
  # 	resources :users
  # end
  root "posts#index"
  get "homes/about" => "homes#about"
  get "users/bmi" => "homes#bmi"
  resources :users
  resources :posts do
    resources :post_messages, only: [:create, :destroy]
  end
  get "posts/new" => "posts#new"

  namespace :admin do
  	# get "/users" => "admin_users#index"
  	resources :users
  end
end
