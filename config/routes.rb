RhokPlanGenerator::Application.routes.draw do

  root :to => "home#index"

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :home, only: [:index]

  resources :events
  resources :tasks
  resources :plans, only: [:create] do
    get "download"
  end

  get "plans/:public_guid/duplicate", to: "plans#duplicate", as: 'plan_duplicate'
  get "plans/:private_guid/allocations", to: "allocations#index", as: 'plan_allocations'

  resources :allocations, only: [:create, :destroy]


  get "/sharedplans/:id", to: "shared_plans#show"

  resources :people
  resources :signups
end
