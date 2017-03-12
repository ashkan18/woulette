# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :woulette,
  ecto_repos: [Woulette.Repo]

# Configures the endpoint
config :woulette, Woulette.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nA30jbGe1dWwZsSfiwdsA2PZAYrxvE1s4xaERneHonvsUYZSlFXS4u/8Hezo/Yn+",
  render_errors: [view: Woulette.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Woulette.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
