defmodule AppWeb.Admin.NewEventTypeLive do
  use AppWeb, :admin_live_view

  alias App.EventType

  def mount(_params, _session, socket) do
    event_type = %EventType{}

    socket =
      socket
      |> assign(section: "event_types")
      |> assign(page_title: "New event type")
      |> assign(event_type: event_type)
      |> assign(changeset: EventType.changeset(event_type, %{}))

    {:ok, socket}
  end

  def handle_info({:submit, params}, socket) do
    params
    |> App.insert_event_type()
    |> case do
      {:ok, event_type} ->
        socket = put_flash(socket, :info, "Saved")

        {:noreply,
         push_redirect(socket,
           to: Routes.live_path(socket, AppWeb.Admin.EditEventTypeLive, event_type.id)
         )}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
