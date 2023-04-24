Rails.application.routes.draw do
  root 'application#index'

  resource :session,      only: %i[create destroy]
  resource :registration, only: %i[new create]

  namespace :admin do
    resources :products, only: %i[index new create destroy]
  end
end
