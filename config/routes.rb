Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'amazons#index'
  resources :amazons
  resources :amazons, :only => [:index,:new,:destroy,:create,:show]

  resources :students
  resources :products, :only => [:index,:show] do
    get :add_cart
    get :remove_cart 
  	resources :favorites do
      collection do
        get :add_favorite
        get :remove_favorite
      end
    end
  end 
  get "/favorites", to: "favorites#index"
  resources :carts
  get "/update_cart_item_quantity/:type/:cart_item_id" => "carts#update_cart_item_quantity", as: :update_cart_item_quantity
end
