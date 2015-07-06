Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :users
    resources :sessions, :only => [:create, :destroy]
    resources :periods do
      resources :performances
    end
  end
end
