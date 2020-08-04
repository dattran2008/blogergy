Rails.application.routes.draw do
  root 'homepage#home'
  get 'journal', to:'journal#index'
  resources :articles
end
