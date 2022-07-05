Rails.application.routes.draw do
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books
  root to: 'homes#top'
  patch 'users/:id' => 'users#update', as: 'update_users'
  # delete '/books/:id' => 'books#destroy', as: 'delete_book'
  get 'home/about' => 'homes#about', as: 'about'
  # resources :homes, :only => [:about]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
