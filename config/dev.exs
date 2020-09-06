import Config

port = case System.get_env("PORT") do
         nil -> 4000
         string_port -> String.to_integer(string_port)
       end

config :wooo, WoooWeb.Endpoint,
  http: [port: port],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :wooo, WoooWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/wooo_web/.*(ex)$},
    ]
  ]

config :wooo,
  csp_connect_sources: ["ws://localhost:#{port}"]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :libcluster,
  topologies: [
    local: [
      strategy: Elixir.Cluster.Strategy.Epmd,
      config: [
        hosts: [:"wooo@127.0.0.1", :"woooo@127.0.0.1"]
      ]
    ]
  ]
