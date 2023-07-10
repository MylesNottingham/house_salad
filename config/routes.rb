Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get "/search", to: "search#index"
  post "/search", to: "search#search"
end
