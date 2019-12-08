Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  resources :schedules
  post 'payments' => 'payments#create'
  resources :hours
  resources :arenas do
    get :faye, on: :collection
  end
  
  root 'schedules#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
