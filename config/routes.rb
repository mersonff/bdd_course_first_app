Rails.application.routes.draw do
  devise_for :users
  root to: "routines#index"

  resources :routines do
    resources :comments
  end

  mount ActionCable.server => '/cable'

end
