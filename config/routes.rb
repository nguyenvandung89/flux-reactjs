Rails.application.routes.draw do
  resources :articles
  root "articles#dashboard"
end
