Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 		 'admins/sessions',
  	passwords: 		 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
  	sessions: 		 'users/sessions',
  	passwords: 		 'users/passwords',
  	registrations: 'users/registrations'
  }

  #user
  namespace :user do
    resources :ramen_noodles
    resources :users
  end

  root "user/homes#top"
  get "ramen_noodles" => "ramen_noodles#index"
  get "about" => "user/homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
