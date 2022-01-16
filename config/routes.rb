Rails.application.routes.draw do
  root "users#index"
  resources :users, only:%i[new index show create destroy] do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: %i[new create destroy]
end
