Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'home#index'
  get 'products/decode', to: 'products#decode'
  defaults format: :json do
    resources :products
  end
end
