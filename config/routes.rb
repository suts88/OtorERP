Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: "users/passwords",
  }



  resource :two_factor_auth, only: [:new, :create, :destroy], controller: "users/two_factor_auth"

  # Route für die Gesundheit/Statusüberprüfung (Health Check)
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA-Routen (Service-Worker und Manifest)
  resource :pwa, only: [] do
    get "service-worker", to: "pwa#service_worker", as: :service_worker
    get "manifest", to: "pwa#manifest", as: :manifest
  end
  # If Authenticated
  authenticated :user do
    root to: "dashboard#index", as: :user_root
    get "dashboard/:section", to: "dashboard#show", as: "dashboard_section"
    resources :memos
    delete "memos/:id", to: "memos#destroy", as: "memo_delete"
    get "memos/new", to: "memos#new", as: "memo_new"
    resources :staff
    resources :stock
    resources :procurement
  end

  # Root-Route (Landing Page)
  root "landing#index"
end
