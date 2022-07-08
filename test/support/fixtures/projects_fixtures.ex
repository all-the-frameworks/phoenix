defmodule ProjectManager.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectManager.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ProjectManager.Projects.create_project()

    project
  end
end
