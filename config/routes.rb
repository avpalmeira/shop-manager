Rails.application.routes.draw do
  root to: 'home#index'
  resources :products
  devise_for :users, skip: [:sessions]
	as :user do
		get 'signin', to: 'devise/sessions#new', as: :new_user_session
		post 'signin', to: 'devise/sessions#create', as: :user_session
		match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
	end
end
