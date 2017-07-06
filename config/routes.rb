Rails.application.routes.draw do

  get 'static_pages/help'

  devise_for :users do
    resources :posts
  end

  resources :posts, only: [:create, :destroy] do
  	resources :comments
  end

  resources :comments do 
  	resources :comments
  end

  root to: "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
