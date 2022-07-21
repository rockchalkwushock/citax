defmodule App do
  @moduledoc """
  App keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defdelegate available_event_types,
    to: App.EventType.Repo,
    as: :available

  defdelegate build_time_slots(date, time_zone, duration),
    to: App.TimeSlots,
    as: :build

  defdelegate get_event_by_id(id),
    to: App.Event.Repo,
    as: :get

  defdelegate get_event_type_by_slug(slug),
    to: App.EventType.Repo,
    as: :get_by_slug

  defdelegate insert_event(params),
    to: App.Event.Repo,
    as: :insert
end
