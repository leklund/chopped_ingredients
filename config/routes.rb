Rails.application.routes.draw do

  namespace :admin do
    resources :seasons
    resources :contestants
    resources :judges
    resources :ingredients
    resources :shows

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
