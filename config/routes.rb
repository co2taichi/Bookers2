Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]

  end
  root to: 'homes#top'
  patch 'users/:id' => 'users#update', as: 'update_users'
  get 'home/about' => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
