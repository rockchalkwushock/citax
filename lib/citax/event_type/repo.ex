defmodule App.EventType.Repo do
  alias App.{EventType, Repo}
  import Ecto.Query, only: [order_by: 3, where: 3]

  # alias AppWeb.Components.EventType

  def available do
    EventType
    |> where([e], is_nil(e.deleted_at))
    |> order_by([e], e.name)
    |> Repo.all()
  end

  def clone(%EventType{name: name, slug: _slug} = event_type) do
    event_type
    |> Map.from_struct()
    |> Map.put(:name, "#{name} (clone)")
    |> insert()
  end

  def delete(event_type) do
    event_type
    |> EventType.delete_changeset()
    |> Repo.update()
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
