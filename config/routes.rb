Rails.application.routes.draw do
  namespace :api do

    get "/users" => "users#index"
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/user/trips" => "trips#index"
    post "/user/trips" => "trips#create"
    get "/user/trips/:id" => "trips#show"
    patch "/user/trips/:id" => "trips#update"
    delete "/user/trips/:id" => "trips#destroy"

    get "/user/trips/:id/posts" => "posts#index"
    post "/user/trips/:id/posts" => "posts#create"
    get "/user/trips/:id/posts/:id" => "posts#show"
    patch "/user/trips/:id/posts/:id" => "posts#update"
    delete "/user/trips/:id/posts/:id" => "posts#destroy"

  end
end
