Rails.application.routes.draw do
  resources :articles
  root 'article#index'
end
