Rails.application.routes.draw do
  root "users#index"
  resources :users, only:[:new, :index, :show, :create, :destroy] do
    collection do
      post :confirm
    end
  end
end
