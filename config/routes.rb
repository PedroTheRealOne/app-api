Rails.application.routes.draw do
  scope "/", defaults: { format: :json } do
    controller :users do
      get "/users" => :index
      post "/users" => :create
    end

    controller :sessions do
      post "/sessions" => :create
    end

    controller :posts do
      get "/posts" => :index
      get "/posts/:id" => :show
      post "/posts" => :create
      patch "/posts/:id" => :update
    end

    controller :likes do
      get "/likes" => :index
      post "/likes" => :create
    end
  end
end
