defmodule Wooo.Endpoint do
  """
  The main endpoint that is run for hosting the LiveView app
  """
  @session_options [
    store: :cookie,
    key: "_woookie",
    signing_salt: "SekoFX7T" # TODO - change this
  ]

  use Phoenix.Endpoint, otp_app: :wooo

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :wooo,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session, @session_options

  plug Wooo.Router
end
