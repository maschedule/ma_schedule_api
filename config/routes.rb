Rails.application.routes.draw do
  namespace :api do
    resources :periods do
      resources :performances
    end
  end
end
