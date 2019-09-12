# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chatoid,
  ecto_repos: [Chatoid.Repo]

# Configures the endpoint
config :chatoid, ChatoidWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "drjpnOJ/RrQkEQRRjRy7r2c1pOmc4Mr3nWvK22HeVpiXKzNOdwIVP1s2pB5Fq66M",
  render_errors: [view: ChatoidWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatoid.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
