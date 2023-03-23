Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/stars', to: 'stars#index'
  get '/stars/:id', to: 'stars#show'
  get '/planets', to: 'planets#index'
end
