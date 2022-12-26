Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'amazons#index'
  resources :amazons
  resources :amazons, :only => [:index,:new,:destroy,:create,:show]

  resources :students
  resources :products   
end
