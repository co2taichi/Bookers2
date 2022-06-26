Rails.application.routes.draw do
  get 'books/new'
  get 'books/show'
  get 'books/edit'
  get 'books/index'
  devise_for :users
  root to: 'homes#top', as: 'top'
  get 'homes/about' => 'homes#about', as: 'about'
  # resources :homes, :only => [:about]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
