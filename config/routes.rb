Rails.application.routes.draw do
  resources :schedules
  resources :hours
  resources :arenas
  resources :users

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
