Rails.application.routes.draw do
  resources :ski_areas
  resources :ski_area_reviews
  resources :ski_check_ins
  resources :friends
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
