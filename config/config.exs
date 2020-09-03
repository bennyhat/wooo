use Mix.Config

config :wooo, WoooWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KiuTDgV77M8h29pcyK025aY5OZQoRcMGuSOXBafCYqsfzbOevXDO+kgz+PBJy3Oa", #TODO - change
  render_errors: [view: WoooWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WoooWeb.PubSub,
  live_view: [signing_salt: "h2725iUf"] #TODO - change

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
