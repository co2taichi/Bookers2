Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: 'top'
  get 'homes/about' => 'homes#about', as: 'about'
  resources :books
  resources :users, only: [:index, :show, :edit]
  patch 'users/:id' => 'users#update', as: 'update_users'
  delete 'books/:id' => 'books#destroy', as: 'delete_book'
  # resources :homes, :only => [:about]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
