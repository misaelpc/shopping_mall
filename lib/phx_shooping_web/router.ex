defmodule PhxShoopingWeb.Router do
  use PhxShoopingWeb, :router

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

  scope "/", PhxShoopingWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/cart", CartController, :index
    get "/cart/increment", CartController, :web_inc
  end

  # Other scopes may use custom stacks.
  scope "/api", PhxShoopingWeb do
    pipe_through :api
    post "/add", CartController, :add
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PhxShoopingWeb.Telemetry
    end
  end
end
