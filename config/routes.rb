require "sidekiq/web"
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => "/sidekiq"
  # Defines the root path route ("/")
  # root "posts#index"
  namespace :v1 do
    resources :applications, only: [:index, :create, :update, :show], param: :token do
      member do
        resources :chats, only: [:index, :create, :show], param: :number do
          member do
            resources :messages, only: [:index, :create, :destroy], param: :message_number do
              collection do
                get :search
              end
            end
          end
        end
      end
    end
  end
end
