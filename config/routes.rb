Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'home#index'
  defaults format: :json do
    get 'products/decode', to: 'products#decode'
    resources :products
  end
end
