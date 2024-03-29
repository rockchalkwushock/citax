defmodule AppWeb.Admin.EditEventTypeLive do
  use AppWeb, :admin_live_view

  alias App.EventType

  def mount(%{"id" => id}, _session, socket) do
    case App.get_event_type_by_id(id) do
      {:ok, %EventType{name: name} = event_type} ->
        socket =
          socket
          |> assign(section: "event_types")
          |> assign(page_title: name)
          |> assign(event_type: event_type)
          |> assign(changeset: EventType.changeset(event_type, %{}))

        {:ok, socket}

      _ ->
        {:ok, socket, layout: {AppWeb.LayoutView, "not_found.html"}}
    end
  end

  def handle_info({:submit, params}, %{assigns: %{event_type: event_type}} = socket) do
    event_type
    |> App.update_event_type(params)
    |> case do
      {:ok, event_type} ->
        socket =
          socket
          |> put_flash(:info, "Saved")
          |> assign(event_type: event_type)
          |> assign(changeset: EventType.changeset(event_type, %{}))

        {:noreply, socket}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
