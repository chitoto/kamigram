Rails.application.routes.draw do
  root to: "users#index"
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
end
