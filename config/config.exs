# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_shooping,
  ecto_repos: [PhxShooping.Repo]

# Configures the endpoint
config :phx_shooping, PhxShoopingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i9lUnM44Rh/uvGHvaXRmFA8IskJWiuf2xEz/cGBNKbq8iLB6ZpnLU5nV7O2oT3l8",
  render_errors: [view: PhxShoopingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxShooping.PubSub,
  live_view: [signing_salt: "lVAsa4Ca"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
