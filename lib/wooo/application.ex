defmodule Wooo.Application do
  @moduledoc """
  Main application for Wooo-ing
  """

  use Application

  def start(_type, _args) do
    children =
      [
        {Phoenix.PubSub, [name: WoooWeb.PubSub, adapter: Phoenix.PubSub.PG2]},
        WoooWeb.Endpoint,
      ]
      |> List.flatten()

    opts = [strategy: :one_for_one, name: Wooo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    WoooWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
