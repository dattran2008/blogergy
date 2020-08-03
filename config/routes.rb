Rails.application.routes.draw do
  root 'homepage#home'
  get 'journal', to:'journal#index'
  get 'articles', to:'articles#index'
end
