Rails.application.routes.draw do

  # root :to => 'session#new'

  get '/login' => 'session#new' #login form
  post '/login' => 'session#create' #form submit, check credentials, create session
  delete '/login' => 'session#destroy' #logout (delete session)

  resources :users

  resources :restaurants

  # get 'session/new'
  # get 'session/create'
  # get 'session/destroy'
  # get 'restaurants/new'
  # get 'restaurants/create'
  # get 'restaurants/index'
  # get 'restaurants/show'
  # get 'restaurants/edit'
  # get 'restaurants/update'
  # get 'restaurants/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
end
