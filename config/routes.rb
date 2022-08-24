Rails.application.routes.draw do
  scope "/", defaults: { format: :json } do
    controller :users do
      get "/users" => :index
      post "/users" => :create
    end

    controller :sessions do
      post "/sessions" => :create
    end
  end
end
