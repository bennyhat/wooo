defmodule WoooWeb.Router do
  @moduledoc """
  The main router that is used for getting us to the LiveView page
  """
  use Phoenix.Router
  import Plug.Conn
  import Phoenix.Controller
  import Phoenix.LiveView.Router


  pipeline :browser do
    plug Plug.Logger
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_root_layout, html: {WoooWeb.LayoutView, :root}
    plug WoooWeb.Plugs.Csp
  end

  scope "/", WoooWeb do
    pipe_through :browser

    live "/", WoooLiveView
  end
end
