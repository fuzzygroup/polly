Rails.application.routes.draw do
  resources :projects
  resources :vetting_transcripts
  resources :vetting_questions
  resources :groups
  resources :organizations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "home/index"

  %w[about contact faqs features].each do |page|
    get page, to: "static_pages##{page}", as: page
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }

  devise_scope :user do
    %w[profile me whoami].each do |route|
      get "user/#{route}", to: "users/registrations#show"
    end

    get "user/settings", to: "users/settings#index"
  end

  resources :users, only: [ :index, :new, :edit, :update, :show, :destroy ], constraints: { id: /\d+/ } do
    collection do
      post "/create" => "users#create"
    end
  end

  get "search" => "search#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
