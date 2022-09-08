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
      delete "/likes/:id" => :destroy
    end

    controller :followers do
      get "/followers" => :index
      post "/followers" => :create
      delete "/followers/:id" => :destroy
    end

    controller :followings do
      get "/followings" => :index
      post "/followings" => :create
      delete "/followings/:id" => :destroy
    end

    controller :feeds do
      get "/feed" => :index
    end
  end
end
