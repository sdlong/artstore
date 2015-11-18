Rails.application.routes.draw do
  
  devise_for :users
  namespace :admin do
  	root 'products#index'
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :users do
      member do
      	post :to_admin
      	post :to_user
      end
    end
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :orders do
    member do
      get :pay_with_credit_card
    end
  end
  root 'products#index'
  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end
  resources :items, controller: "cart_items"
  namespace :account do
    resources :orders
  end
end
