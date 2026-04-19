Rails.application.routes.draw do
  get "home/index"
  get "resources/index"
  get "favorites/index"
  get "people/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # get "people", to: "people#index"
  # get "people", to: "people#index"
  # get "people/:id", to: "people#show", as: "person"
  # root "people#index"
  root "home#index"

  resources :favorites, only: [ :index, :destroy ] do
    post :toggle, on: :collection
  end

  get "/:resource", to: "resources#index", as: "resource_index"
  get "/:resource/:id", to: "resources#show", as: "resource_show"
end
