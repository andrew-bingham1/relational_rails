Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/stars', to: 'stars#index'
  get '/stars/:star_id/planets', to: 'star_planets#index'
  get '/stars/:star_id/planets/new', to: 'star_planets#new'
  post '/stars/:star_id/planets/new', to: 'star_planets#create'
  get '/stars/new', to: 'stars#new'
  post 'stars', to: 'stars#create'
  get '/stars/:id', to: 'stars#show'
  get '/stars/:id/edit', to: 'stars#edit'
  patch '/stars/:id', to: 'stars#update'
  delete '/stars/:id', to: 'stars#destroy'
  get '/planets', to: 'planets#index'
  get '/planets/:id', to: 'planets#show'
  get '/planets/:id/edit', to: 'planets#edit'
  patch '/planets/:id', to: 'planets#update'
end
