Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  root to: 'application#welcome'
  resources :productions do 
    resources :companies
  end
  resources :companies 

  delete '/productions/:id', to: 'productions#destroy', as: 'delete_production'

  get '/productions/:id/publish', to: 'productions#activate', as: 'publish_production'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end
end
