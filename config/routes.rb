Rails.application.routes.draw do

  devise_for :admins,
    controllers: {
      sessions: 'admins/sessions',
      registrations: "admins/registrations"
  }
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations",
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  
  # scope :users do
    get "posts/new" => "posts#new"
    get "homes/top" => "homes#top"
    get "homes/about" => "homes#about"
    get "homes/community" => "homes#community"
    get "users/bmi" => "homes#bmi"
    post "users/bmi_Calculation" => "homes#bmi_calculation"
    get "posts/tags" => "posts#post_tags_index"
    get "training_record/new" => "training_records#new"
    resources :users do
      get :follows, on: :member
      get :followers, on: :member
    end
    resources :rooms, only: [:index, :show, :create]
    resources :relation_ships, only: [:create, :destroy]
    resources :training_records, only: [:index, :show, :create, :destroy]
    resources :training_menus, only: [:index]
    resources :posts do
      resources :post_messages, only: [:create, :destroy]
      resource :goods, only: [:create, :destroy]
    end
  # end

  namespace :admins do
    get "homes/top" => "homes#top"
    get "posts/tags" => "posts#post_tags_index"
  	resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :training_menus, only: [:index, :edit, :create, :update, :destroy]
    resources :post_messages, only: [:destroy]
    resources :rooms, only: [:index, :destroy]
  end
end
