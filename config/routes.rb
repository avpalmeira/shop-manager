Rails.application.routes.draw do
  resources :products
  devise_for :users
end
