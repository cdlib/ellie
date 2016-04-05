Rails.application.routes.draw do
  resources :clusters
  resources :items, constraints: { id: /([a-z]|[0-9])+\.\$*([a-z]|[A-Z]|[0-9]|\/|\:|\$)+/ }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  
  # SearchController
  get '/search', to: 'search#new'
end
