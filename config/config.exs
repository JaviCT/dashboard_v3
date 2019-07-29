# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dashboard2,
  ecto_repos: [Dashboard2.Repo]

# Configures the endpoint
config :dashboard2, Dashboard2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Mt2243Lo5V1A4iBEu5NwOWgVbliu8vxTVgIpw4sGpqOXZ7ygjdFmYgaqYxlmRSQ4",
  render_errors: [view: Dashboard2Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dashboard2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
