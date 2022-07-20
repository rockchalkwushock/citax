defmodule AppWeb.Live.InitAssigns do
  import Phoenix.LiveView

  def on_mount(:default, _params, _session, socket) do
    owner = Application.get_env(:citax, :owner)
    socket = assign(socket, :owner, owner)

    {:cont, socket}
  end
end
