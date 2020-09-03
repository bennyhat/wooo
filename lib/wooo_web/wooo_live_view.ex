defmodule WoooWeb.WoooLiveView do
  @moduledoc """
  The main view for the Wooo-ing
  """
  use Phoenix.LiveView
  alias WoooWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~L"""
    <wooo>
      <img id="woooo" phx-click="wooo" src="images/woooo.jpg" alt="Ric Flair wooing the words 'woooooooooooooo'"/>
      <audio id="wooo" phx-hook="Wooo" preload="auto">
        <source src="https://peal.io/download/ofp0f" type="audio/mpeg">
      </audio>
    </wooo>
    """
  end

  def mount(_params, _session, socket) do
    WoooWeb.Endpoint.subscribe("wooo")
    {:ok, socket}
  end

  def handle_event("wooo", _data, socket) do
    WoooWeb.Endpoint.broadcast("wooo", "woooo", %{})
    {:noreply, socket}
  end

  def handle_info(%{topic: "wooo", event: "woooo"}, socket) do
    {:noreply, push_event(socket, "wooo", %{})}
  end
end
