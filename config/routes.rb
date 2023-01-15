Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/contact'
  resources :conversations, only: [:new, :create, :show] do
    post '/messages', to: "messages#create"
  end

  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  
  root 'conversations#new'

  post '/incoming_messages', to: "incoming_messages#create"

  mount ActionCable.server => '/cable'
end
