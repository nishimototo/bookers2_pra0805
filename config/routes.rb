Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"
  get "chats/:id" => "chats#show", as: "chat"

  resources :users do
    resource :relationships, only: [:create, :destroy]
      get "follows" => "users#follows"
      get "followers" => "users#followers"
      get "book_search" => "users#book_search"
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :chats, only: [:create]
  resources :groups do
    get "join" => "groups#join"
  end
end
