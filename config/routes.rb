Rails.application.routes.draw do
  get '/pairings' => 'pairings#index'
  get '/pairings/new' => 'pairings#new'
  post '/pairings' => 'pairings#create'
  get '/pairings/:id' => 'pairings#show'
end
