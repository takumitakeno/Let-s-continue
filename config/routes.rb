Rails.application.routes.draw do

  devise_for :users,
   controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # scope :admins do
  # 	resources :users
  # end

  root 'posts#index'
  get "posts/new" => "posts#new"
  get "homes/about" => "homes#about"
  get "users/bmi" => "homes#bmi"

  resources :users do
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :relation_ships, only: [:create, :destroy]

  resources :posts do
    resources :post_messages, only: [:create, :destroy]
    resource :goods, only: [:create, :destroy]
  end

  namespace :admin do
  	# get "/users" => "admin_users#index"
    get "homes/top" => "homes#top"
  	resources :users, only: [:index, :show]
    resources :posts, only: [:index, :show]
  end
end
