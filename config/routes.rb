Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
      patch :confirm # confirm後のupdateに必要
    end
    member do
     patch :confirm  # confirm_pictures_pathの生成に必要
    end
  end
  root to: "users#index"
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
end
