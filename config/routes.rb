Rails.application.routes.draw do
  get '/tasks/hide', to: 'tasks#hide'
  resources :tasks
  root 'tasks#index'
end
