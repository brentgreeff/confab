Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "projects#show"

  resources :comments, only: [ :create ]
  resource :project, only: [ :edit, :update ]

  # Render dynamic PWA files from app/views/pwa/*
  # (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
