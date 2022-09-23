Rails.application.routes.draw do
  root 'homes#index'
  get  '/show',  to: 'homes#show'
  get  '/about', to: 'homes#about'

  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
