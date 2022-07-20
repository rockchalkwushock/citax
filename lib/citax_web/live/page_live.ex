defmodule AppWeb.PageLive do
  use AppWeb, :live_view

  alias AppWeb.Components.EventType

  @impl true
  def mount(_params, _session, socket) do
    event_types = App.available_event_types()

    {:ok, assign(socket, event_types: event_types), temporary_assigns: [event_types: []]}
  end
end
