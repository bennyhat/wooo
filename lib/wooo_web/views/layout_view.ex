defmodule WoooWeb.LayoutView do
  use Phoenix.View,
    root: "lib/wooo_web/templates",
    namespace: WoooWeb

  use Phoenix.HTML

  alias WoooWeb.Router.Helpers, as: Routes
end
