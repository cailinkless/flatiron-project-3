Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  root to: 'application#welcome'
  resources :productions 
  resources :companies do 
    resources :productions
  end

  delete '/productions/:id', to: 'productions#destroy', as: 'delete_production'

  get '/productions/:id/publish', to: 'productions#publish', as: 'publish_production'

  get '/productions/error', to: 'productions#error', as: 'productions_error'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end
end
