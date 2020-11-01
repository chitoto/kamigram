Rails.application.routes.draw do
  root to: "users#index"
  resources :pictures do
    collection do
      post :confirm
      patch :confirm # confirm後のupdateに必要
    end
    member do
     patch :confirm  # confirm_pictures_pathの生成に必要
    end
  end
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
