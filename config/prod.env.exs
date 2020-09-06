import Config

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

allowed_origins =
  System.get_env("ALLOWED_ORIGINS") ||
  raise """
  environment variable ALLOWED_ORIGINS is missing.
  Please set it to what you expect the production site to be accessed with
  """

allowed_origins_list = String.split(allowed_origins, ",")

libcluster_k8s_selector =
  System.get_env("LIBCLUSTER_KUBERNETES_SELECTOR") ||
  raise """
  environment variable LIBCLUSTER_KUBERNETES_SELECTOR is missing.
  Please set it to what you expect the production site to cluster with
  """

libcluster_k8s_node_basename =
  System.get_env("LIBCLUSTER_KUBERNETES_NODE_BASENAME") ||
  raise """
  environment variable LIBCLUSTER_KUBERNETES_NODE_BASENAME is missing.
  Please set it to what you expect the production site to cluster with
  """

config :wooo, WoooWeb.Endpoint,
  http: [
    port: String.to_integer(port),
    transport_options: [socket_opts: [:inet6]]
  ],
  check_origin: allowed_origins_list,
  url: [host: hostname, port: 443],
  secret_key_base: secret_key_base,
  live_view: [signing_salt: live_view_signing_salt]

config :wooo,
  csp_connect_sources: Enum.map(allowed_origins_list, &String.replace(&1, "//", "wss://"))

config :libcluster,
  topologies: [
    k8s: [
      strategy: Cluster.Strategy.Kubernetes,
      config: [
        kubernetes_selector: libcluster_k8s_selector,
        kubernetes_node_basename: libcluster_k8s_node_basename
      ]
    ]
  ]
