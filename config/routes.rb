Week6::Application.routes.draw do

  get "/login" => 'sessions#new'
  get "/logout" => 'sessions#destroy'
  get "/authenticate" => 'sessions#create'

  root 'sessions#new'

  get "/users/new" => 'users#new'
  get "/users/create" => 'users#create'
  get "/users/:user_id/show" => 'users#show'
  get "/users/:user_id/edit" => "users#edit"
  get "/users/:user_id/update" => "users#update"
   get "/users/:user_id/reviews" => "users#feedback"

  # Audio-related URLs

  # CREATE
  get "/audio/new" => "audio#new"
  get "/audio/create" => "audio#create"

  # READ
  get "/audio" => 'audio#index'
  get "/audio/:audio_id/show" => "audio#show"

  # UPDATE
  get "/audio/:audio_id/edit" => "audio#edit"
  get "/audio/:audio_id/update" => "audio#update"

  # DELETE
  get "/audio/:audio_id/delete" => "audio#destroy"

  # Review-related URLs

  get "/reviews/create" => 'reviews#create'
get "reviews" => "users#reviews"

end
