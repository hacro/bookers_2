Rails.application.routes.draw do

  devise_for :users
  get 'home/about' => 'homes#about', as: 'about'
  root to: "homes#top"

  resources :books, only: [:new, :show, :index, :create, :destroy, :edit, :update]
  resources :users, only: [:edit, :show, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
