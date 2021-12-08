Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :non_ski_reviews

      resources :non_ski_activities

      resources :ski_areas

      resources :ski_area_reviews

      resources :ski_check_ins

      resources :friends

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "friends#index"
  resources :non_ski_reviews
  resources :non_ski_activities
  resources :ski_areas
  resources :ski_area_reviews
  resources :ski_check_ins
  resources :friends
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
