defmodule AppWeb.Admin.Components.EventType do
  use AppWeb, :live_component

  alias AppWeb.Admin.Components.Dropdown

  def mount(socket) do
    {:ok, socket}
  end

  def handle_event("clone_me", _params, socket) do
    event_type = socket.assigns.event_type

    case App.clone_event_type(event_type) do
      {:ok, new_event_type} ->
        {:noreply,
         push_redirect(socket,
           to: Routes.live_path(socket, AppWeb.Admin.EditEventTypeLive, new_event_type.id)
         )}

      {:error, _} ->
        send(self(), :clone_error)
        {:noreply, socket}
    end
  end

  def handle_event("delete_me", _params, socket) do
    event_type = socket.assigns.event_type

    send(self(), {:confirm_delete, event_type})

    {:noreply, socket}
  end
end
