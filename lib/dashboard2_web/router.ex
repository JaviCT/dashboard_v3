defmodule Dashboard2Web.Router do
  use Dashboard2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Dashboard2Web do
    pipe_through :browser # Use the default browser stack

    get "/get_profile", PageController, :get_profile
    get "/users/sign_in", PageController, :login
    post "/users/sign_in", PageController, :create
    post "/sessions/api", PageController, :create_api
    get "/users/sign_out", PageController, :logout
    get "/*anything", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Dashboard2Web do
  #   pipe_through :api
  # end
end
