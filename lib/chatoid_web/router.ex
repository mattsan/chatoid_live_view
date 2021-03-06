defmodule ChatoidWeb.Router do
  use ChatoidWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatoidWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/chat", ChatLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatoidWeb do
  #   pipe_through :api
  # end
end
