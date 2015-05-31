Rails.application.routes.draw do
  get 'main' => 'main#index'

  resources :periods do
    resources :performances
  end
end
