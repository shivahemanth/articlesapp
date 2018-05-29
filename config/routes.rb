Rails.application.routes.draw do
  get 'users/new'

  get    '/signup',  to: 'users#signup'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users	
  
  resources :article_attachments
  
  resources :articles do
    resources :comments
  end  
  root to: 'articles#index'
end
