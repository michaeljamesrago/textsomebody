Rails.application.routes.draw do
  resources :conversations do
    resources :messages
  end
  
  root 'conversations#new'

  post '/incoming_messages', to: "incoming_messages#create"

  mount ActionCable.server => '/cable'
end
