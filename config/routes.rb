Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    resources :events
  end

  root to: 'admin/events#index'

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show]
    end
  end
end
