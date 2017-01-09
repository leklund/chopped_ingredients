Rails.application.routes.draw do
  resources :seasons
  resources :contestants
  resources :judges
  resources :ingredients
  resources :shows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
