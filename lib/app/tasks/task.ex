defmodule ProjectManager.Tasks.Task do
  alias ProjectManager.Projects.Project
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    belongs_to :project, Project
    field :cancelled_at, :naive_datetime
    field :completed_at, :naive_datetime
    field :description, :string
    field :state, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:project_id, :subject, :description, :state, :completed_at, :cancelled_at])
    |> validate_required([:project_id, :subject, :description, :state])
  end
end
