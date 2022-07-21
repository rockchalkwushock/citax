defmodule AppWeb.Admin.EventTypesLive do
  use AppWeb, :admin_live_view

  def mount(_params, _session, socket) do
    {:ok, socket, temporary_assigns: [event_types: []]}
  end

  def handle_params(_, _, socket) do
    event_types = App.available_event_types()
    socket =
      socket
      |> assign(section: "event_types")
      |> assign(page_title: "Event types")
      |> assign(event_types: event_types)
      |> assign(event_types_count: length(event_types))

    {:noreply, socket}
  end
end
