Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # scope :admins do
  # 	resources :users
  # end

  get "homes/about" => "homes#about"
  get "users/bmi" => "homes#bmi"
  resources :users

  namespace :admin do
  	# get "/users" => "admin_users#index"
  end
  # root "users/homes#about"
end
