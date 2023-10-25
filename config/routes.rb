Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "feed#index"
  resources :subscriptions, path: :sub
  resources :webhook
  post "/webhook/:id", to: "webhook#post"
end
