Rails.application.routes.draw do
  get  'inquiries/index'    => 'inquiries#index'
  post 'inquiries/confirm'  => 'inquiries#confirm'
  post 'inquiries/thanks'   => 'inquiries#thanks'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  # user
  namespace :user do
    resources :users
    resources :ramen_noodles do
      resources :ramen_noodle_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      get :search, on: :collection
    end
  end

  root "user/homes#top"
  get  "ramen_noodles"  => "ramen_noodles#index"
  get  "about"          => "user/homes#about"

  # admin
  namespace :admin do
    root "homes#top"
    resources :users, only: [:index, :show, :destroy]
    resources :ramen_noodles, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
