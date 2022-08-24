Rails.application.routes.draw do
  scope "/", defaults: { format: :json } do
    controller :users do
      post "/users" => :create
    end
  end
end
