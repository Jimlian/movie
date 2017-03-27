Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :posts
  end
  root 'movies#index'
end
