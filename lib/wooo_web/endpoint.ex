defmodule WoooWeb.Endpoint do
  @moduledoc """
  The main endpoint that is run for hosting the LiveView app
  """
  @session_options [
    store: :cookie,
    key: "_woookie",
    signing_salt: "vZ7QJ1g3" # the other secrets + this are enough for this to be hardcoded
  ]

  use Phoenix.Endpoint, otp_app: :wooo

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :wooo,
    gzip: false,
    only: ~w(css media fonts images js favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session, @session_options

  plug WoooWeb.Router
end
