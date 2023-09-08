Rails.application.routes.draw do
  root 'app/feedback_sessions#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount CoverImageUploader.derivation_endpoint => "/derivations/cover_image"
  mount Sidekiq::Web => '/queue'

  namespace :app do
    resources :feedback_sessions, only: [:index] do
      resources :session_comments, only: [:index, :new]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :feedback_sessions, only: [:index, :create] do
        resources :session_comments, only: [:create]
      end
      resources :users, only: [:index]
    end
  end
  namespace :app do
    resources :feedback_sessions, only: [:new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
