Rails.application.routes.draw do
  get '/pairings' => 'pairings#index'
  get '/pairings/new' => 'pairings#new'
  post '/pairings' => 'pairings#create'
  get '/pairings/:id' => 'pairings#show'
  get '/pairings/:id/edit' => 'pairings#edit'
  patch '/pairings/:id' => 'pairings#update'
  delete 'pairings/:id' => 'pairings#destroy'
end
