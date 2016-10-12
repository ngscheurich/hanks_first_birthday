# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hanks_first_birthday,
  ecto_repos: [HanksFirstBirthday.Repo]

# Configures the endpoint
config :hanks_first_birthday, HanksFirstBirthday.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OU6/iwvcTRVAVzF1oQRH8MaChQdYHEsBzuI3CBN6RlyGakR1beQLkSZVMT5nDXSy",
  render_errors: [view: HanksFirstBirthday.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HanksFirstBirthday.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
