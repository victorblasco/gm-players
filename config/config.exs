# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :gm_players, GmPlayers.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "6Z5rB4fIOLha0Cq3jrDqqcKyn+sB80B9dYBgZkO4SFl/i1lrOgZ8S0cXNQx6fTR3",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: GmPlayers.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# AWS
config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  dynamodb: [region: "eu-central-1",
             host: "dynamodb.eu-central-1.amazonaws.com",
             scheme: "https://",
             port: 80]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
