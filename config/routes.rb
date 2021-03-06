Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show], param: :slug
  resources :contestants, only: [:index, :show], param: :slug
  resources :judges, only: [:index, :show], param: :slug
  resources :shows, only: [:index, :show], param: :slug

  root to: 'ingredients#index'

  namespace :admin do
    resources :seasons, param: :slug
    resources :contestants, param: :slug
    resources :judges, param: :slug
    resources :ingredients, param: :slug
    resources :shows, param: :slug

    get '/' => '/admin#index'
  end

  # clearance
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]
  resources :users, controller: 'clearance/users', only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  get '/admin/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/admin/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
end
