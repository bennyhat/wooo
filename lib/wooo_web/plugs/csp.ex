defmodule WoooWeb.Plugs.Csp do
  import Phoenix.Controller

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn
    |> put_secure_browser_headers(%{"content-security-policy" => csp()})
  end

  defp csp_connect_sources() do
    Application.get_env(:wooo, :csp_connect_sources)
    |> Enum.join(" ")
  end

  defp csp() do
    "default-src 'self';" <>
      "style-src 'self' 'unsafe-inline' 'unsafe-eval';" <>
      "script-src 'self' 'unsafe-inline' 'unsafe-eval';" <>
      "font-src data: 'self';" <>
      "img-src 'self' data:;" <>
      "connect-src 'self' #{csp_connect_sources()};" <>
      "media-src *;"
  end
end
