use Mix.Config

config :logger, level: :warn

config :wooo, WoooWeb.Endpoint,
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json",
  version: Mix.Project.config[:version]

import_config "prod.env.exs"
