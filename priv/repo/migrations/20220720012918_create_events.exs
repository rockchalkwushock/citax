defmodule App.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :comments, :text
      add :email, :string, null: false
      add :end_at, :utc_datetime, null: false
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :start_at, :utc_datetime, null: false
      add :time_zone, :string, null: false

      add :event_type_id, references(:event_types, on_delete: :nothing, type: :binary_id),
        null: false

      timestamps()
    end

    create index(:events, [:event_type_id])
  end
end
