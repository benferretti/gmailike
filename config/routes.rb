Rails.application.routes.draw do
  get 'emails/index'
  get 'emails/show'
  get 'emails/new'
  get 'emails/create'
  get 'emails/edit'
  get 'emails/update'
  get 'emails/destroy'
  devise_for :users
  root to: "home#index"
  resources :tasks, except: [:show]
  resources :emails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
