Rails.application.routes.draw do
  root "pictures#index"
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[new index show create destroy]
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
