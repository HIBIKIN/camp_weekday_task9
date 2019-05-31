Rails.application.routes.draw do
  get '/tasks/hide', to: 'tasks#hide'
  resources :tasks do
    collection do
      get :hide
    end
  end
  root 'tasks#index'
end
