use Mix.Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

live_view_signing_salt =
  System.get_env("LIVE_VIEW_SIGNING_SALT") ||
  raise """
  environment variable LIVE_VIEW_SIGNING_SALT is missing.
  You can generate one by calling: mix phx.gen.secret 32
  """

hostname =
  System.get_env("HOSTNAME") ||
  raise """
  environment variable HOSTNAME is missing.
  Please set it to what you expect the production site to be accessed with
  """

port =
  System.get_env("PORT") ||
  raise """
  environment variable PORT is missing.
  Please set it to what you expect the production site to be accessed with
  """

config :wooo, WoooWeb.Endpoint,
  http: [
    port: String.to_integer(port),
    transport_options: [socket_opts: [:inet6]]
  ],
  url: [host: hostname, port: 443],
  secret_key_base: secret_key_base,
  live_view: [signing_salt: live_view_signing_salt]
