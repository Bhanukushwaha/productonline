Rails.application.routes.draw do
  resources :orders
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :amazons
  devise_for :users
  root 'amazons#index'
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
  get 'category_details/:id/products' => "categories#category_details", as: :category_details
  get '/addresses' => "addresses#index", :as => "addresses"
  post '/addresses' => "addresses#create"
  get '/addresses/new' => "addresses#new", :as => "new_address"
  get '/addresses/:id/edit' =>"addresses#edit", :as => "edit_address"
  get '/addresses/:id' =>"addresses#show", :as => "address"
  patch '/addresses/:id' =>"addresses#update"
  delete '/addresses/:id' =>"addresses#destroy"


  get "/favorites", to: "favorites#index"
  resources :carts  
  get "/update_cart_item_quantity/:type/:cart_item_id" => "carts#update_cart_item_quantity", as: :update_cart_item_quantity
end
