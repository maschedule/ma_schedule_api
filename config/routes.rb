Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :periods do
      resources :performances
    end
  end
end
