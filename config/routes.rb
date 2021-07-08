Rails.application.routes.draw do
  root to: "routines#index"

  resources :routines, only: [:new, :index, :create]
end
