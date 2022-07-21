defmodule GlobalSetup do
  @moduledoc """
  Module for any global setup that needs to be executed
  on Fly.io that I cannot just have done in the Dockerfile.
  """
  alias App.{EventType, Repo}

  @event_types [
    %{
      name: "15 minute meeting",
      description: "Short meeting call.",
      slug: "15-minute-meeting",
      duration: 15,
      color: "blue"
    },
    %{
      name: "30 minute meeting",
      description: "Extended meeting call.",
      slug: "30-minute-meeting",
      duration: 30,
      color: "pink"
    },
    %{
      name: "Pair programming session",
      description: "One hour of pure pair programming fun!",
      slug: "pair-programming-session",
      duration: 60,
      color: "purple"
    }
  ]

  def seed_db do
    IO.puts("----------------------------")
    IO.puts("Scrubbing EvenType Table")
    Repo.delete_all(EventType)
    IO.puts("----------------------------")
    IO.puts("Seeding database...")
    for event_type <- @event_types do
      event_type
      |> EventType.changeset()
      |> Repo.insert!()
    end
    IO.puts("----------------------------")
    IO.puts("Finished seeding database...")
    IO.puts("----------------------------")
  end
end
