Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  root to: 'homes#top'
  patch 'users/:id' => 'users#update', as: 'update_users'
  delete 'books/:id' => 'books#destroy', as: 'delete_book'
  get 'home/about' => 'homes#about', as: 'about'
  resources :users, only: [:index, :show, :edit]
  resources :books
  delete 'users/sign_out' => "session#destroy", as: 'delete_user_session'
  # resources :homes, :only => [:about]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
