Rails.application.routes.draw do
  root 'homepage#home'
  get 'journal', to:'journal#index'
  resources :articles
  get 'signup', to:'users#new'
  resources :users, except: [:new]

end
