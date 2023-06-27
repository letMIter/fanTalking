Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users
  resources :users, only: [:show]

  root 'home#index'
  get 'home/link' => 'home#link'

  get 'use/index' => 'use#index'
  get '/group/hashtag/:name' => 'groups#hashtag'
  get '/group/hashtag' => 'groups#hashtag'
  
  resources :users, only: [:show]
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :users, only: [:show]
  end
  
  
end
