defmodule PhxShooping.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {PhxShooping.CartAgent, %PhxShooping.ShopingCart{}},
      %{
        id: PhxShooping.CartWorker,
        start: {PhxShooping.CartWorker, :start_link, [:test]},
        restart: :transient
      },
      # Start the Ecto repository
      PhxShooping.Repo,
      # Start the Telemetry supervisor
      PhxShoopingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxShooping.PubSub},
      # Start the Endpoint (http/https)
      PhxShoopingWeb.Endpoint
      # Start a worker by calling: PhxShooping.Worker.start_link(arg)
      # {PhxShooping.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxShooping.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxShoopingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
