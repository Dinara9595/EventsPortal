Rails.application.routes.draw do
  devise_for :admins
  namespace :admin do
    resources :events
  end

  root to: 'admin/events#index'
end
