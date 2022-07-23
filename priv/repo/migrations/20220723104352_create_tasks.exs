defmodule ProjectManager.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :project_id, references("projects", on_delete: :delete_all)
      add :subject, :string
      add :description, :text
      add :state, :string
      add :completed_at, :naive_datetime
      add :cancelled_at, :naive_datetime

      timestamps()
    end
  end
end
