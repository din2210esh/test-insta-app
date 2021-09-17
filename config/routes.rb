Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'

  root "home#index"
  resources :posts do
  	resources :likes
  end
  devise_for :users, controllers: {
           :sessions => "users/sessions",
           :registrations => "users/registrations" }

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
