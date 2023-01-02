Rails.application.routes.draw do
resources :conversations
root 'conversations#new'
end
