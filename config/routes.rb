Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registration' }

  resources :competences
  root to: 'competences#index'

  namespace :api do
    resources :competences
    root to: 'competences#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
