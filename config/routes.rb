Rails.application.routes.draw do
  resource :session,      only: %i[create destroy]
  resource :registration, only: %i[new create]
end
