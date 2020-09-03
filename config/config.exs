use Mix.Config

config :wooo, WoooWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jwPIJ18hBt4zBsS6/yD8mQKVXmnbLJeaa3pdcntcWWCWm/SJ455ePMfE+FPxcOpm",
  render_errors: [view: WoooWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WoooWeb.PubSub,
  live_view: [signing_salt: "l6on2mLOKdgf6w+Q3eMpbsxtRm6Qq5tv"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
