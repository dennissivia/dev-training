# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, DiscussWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JBVzODGDPaPeLaz7mO1g0PAFpwXq6b4Xjztab63fl/eg39UIHxVakozUz9ZUEbXS",
  render_errors: [view: DiscussWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "39c1e724567dc352f716",
  client_secret: "3afb87d55057be9512360061d44afa379f3c2910"
