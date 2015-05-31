Rails.application.routes.draw do
  resources :periods do
    resources :performances
  end
end
