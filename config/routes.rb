Rails.application.routes.draw do

  devise_for :users
  get 'homes/about' => 'homes#about', as: 'about'
  root to: "homes#top"

  resources :books, only: [:new, :show, :index, :create, :destroy]
  resources :users, only: [:edit, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
