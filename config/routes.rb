Rails.application.routes.draw do
  namespace :admin do
    resources :seasons
    resources :contestants
    resources :judges
    resources :ingredients
    resources :shows
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
