defmodule WoooWeb.ErrorView do
  use Phoenix.View,
    root: "lib/wooo_web/templates",
    namespace: WoooWeb

  use Phoenix.HTML

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
