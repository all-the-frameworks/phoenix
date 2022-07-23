defmodule ProjectManager.TasksFixtures do
  import ProjectManager.ProjectsFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectManager.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        project_id: project_fixture().id,
        cancelled_at: ~N[2022-07-22 10:43:00],
        completed_at: ~N[2022-07-22 10:43:00],
        description: "some description",
        state: "some state",
        subject: "some subject"
      })
      |> ProjectManager.Tasks.create_task()

    task
  end

  def projects_with_tasks_fixtures(attrs \\ %{}) do
    [project_fixture(), project_fixture()]
    |> Enum.map(fn project ->
      attrs = Enum.into(%{ project_id: project.id }, attrs)
      { project, [task_fixture(attrs), task_fixture(attrs)] }
    end)
  end
end
