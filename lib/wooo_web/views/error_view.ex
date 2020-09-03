defmodule WoooWeb.ErrorView do
  use Phoenix.View,
    root: "lib/wooo_web/templates",
    namespace: WoooWeb

  import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

  import Phoenix.LiveView.Helpers, only: [live_render: 2, live_render: 3]

  use Phoenix.HTML

  alias WoooWeb.Router.Helpers, as: Routes

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
