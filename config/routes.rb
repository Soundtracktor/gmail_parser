require 'sidekiq/web'
Rails.application.routes.draw do
  root to: 'searches#new'

	mount Sidekiq::Web => '/sidekiq'

	resources :searches, only: [:new, :create, :show]
end
