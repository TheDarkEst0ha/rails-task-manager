Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: 'tasks#index'
  get '/tasks', to: 'tasks#index', as: :tasks

  # new -> only displays the form
  get '/tasks/new', to: 'tasks#new', as: :new_task

  get '/task/:id', to: 'tasks#show', as: :task

  #  create -> save
  post '/tasks', to: 'tasks#create'

  # edit -> just displays the form
  # I need the id to edit because I want to edit only one task
  get '/task/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/task/:id', to: 'tasks#update'

  delete '/task/:id', to: 'tasks#destroy'
end
