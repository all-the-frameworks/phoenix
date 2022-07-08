defmodule ProjectManager.Projects.Project do
  @moduledoc """
  Ecto model representing a project
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
