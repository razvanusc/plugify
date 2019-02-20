Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
    resources :sessions, only: [:create, :destroy]
    resources :artists do
      resources :requests
    end
    resources :users, only: [:create]
  end
end
