defmodule App.EventType.Repo do
  alias App.{EventType, Repo}
  import Ecto.Query, only: [order_by: 3]

  def available do
    EventType
    |> order_by([e], e.name)
    |> Repo.all()
  end
end
