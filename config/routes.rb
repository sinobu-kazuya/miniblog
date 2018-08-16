Rails.application.routes.draw do
  devise_for :users
root to: "blogs#index"
resources :users
resources :blogs do
  resources :favorites, only: [:create, :destroy, :show]
  end
end
