defmodule AppWeb.EventsLive do
  use AppWeb, :live_view

  def mount(%{"event_type_slug" => slug, "event_id" => id}, _session, socket) do
    with {:ok, event_type} <- App.get_event_type_by_slug(slug),
         {:ok, event} <- App.get_event_by_id(id) do
      socket =
        socket
        |> assign(event_type: event_type)
        |> assign(event: event)

      {:ok, socket}
    else
      {:error, :not_found} ->
        {:ok, socket, layout: {AppWeb.LayoutView, "not_found.html"}}
    end
  end
end
