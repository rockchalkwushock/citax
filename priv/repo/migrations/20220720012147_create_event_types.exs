defmodule App.Repo.Migrations.CreateEventTypes do
  use Ecto.Migration

  def change do
    create table(:event_types, primary_key: false) do
      add :color, :string, null: false
      add :description, :text
      add :duration, :integer, null: false
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :slug, :string, null: false

      timestamps()
    end

    create(unique_index(:event_types, [:slug]))
  end
end
