defmodule App.EventType.Repo do
  alias App.{EventType, Repo}
  import Ecto.Query, only: [order_by: 3]

  # alias AppWeb.Components.EventType

  def available do
    EventType
    |> order_by([e], e.name)
    |> Repo.all()
  end

  def get(id) do
    case Repo.get(EventType, id) do
      nil ->
        {:error, :not_found}

      event_type ->
        {:ok, event_type}
    end
  end

  def get_by_slug(slug) do
    case Repo.get_by(EventType, slug: slug) do
      nil ->
        {:error, :not_found}

      event_type ->
        {:ok, event_type}
    end
  end

  def insert(params) do
    params
    |> EventType.changeset()
    |> Repo.insert()
  end

  def update(event_type, params) do
    event_type
    |> EventType.changeset(params)
    |> Repo.update()
  end
end
