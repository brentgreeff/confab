Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resource :registration, only: %i[new create]
  resource :session
  resources :passwords, param: :token

  root "projects#show"

  resources :comments, only: [ :create ]
  resource :project, only: [ :edit, :update ]

  resources :stats, only: [ :index ]

  # Render dynamic PWA files from app/views/pwa/*
  # (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
