Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:new, :create, :edit, :update, :index] do
    resources :messages, only: [:index, :create]
  end
  get '/groups' => 'groups#new'
  get '/groups/:id' => 'groups#edit'

end
