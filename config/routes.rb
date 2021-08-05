Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"

  resources :users do
    resource :relationships, only: [:create, :destroy]
      get "follows" => "users#follows"
      get "followers" => "users#followers"
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
