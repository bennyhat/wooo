import Config

config :logger, level: :warn

config :wooo, WoooWeb.Endpoint,
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json",
  version: Application.spec(:wooo, :vsn) |> to_string(),
  force_ssl: [rewrite_on: [:x_forwarded_proto]]

import_config "prod.env.exs"
