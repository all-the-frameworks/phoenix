defmodule ProjectManager.TasksTest do
  use ProjectManager.DataCase

  alias ProjectManager.Tasks

  describe "tasks" do
    alias ProjectManager.Tasks.Task

    import ProjectManager.TasksFixtures
    import ProjectManager.ProjectsFixtures

    @invalid_attrs %{project_id: nil, cancelled_at: nil, completed_at: nil, description: nil, state: nil, subject: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "list_tasks/1 when passed an id returns all tasks associated with the given project id" do
      [ { project, _ } | _ ] = projects_with_tasks_fixtures()

      project_ids =
        Tasks.list_tasks(project.id)
        |> Enum.map(&(&1.project_id))
        |> Enum.uniq()

      assert project_ids, [project.id]
    end

    test "list_tasks/1 when passed a project returns all tasks associated with the given project" do
      [ { project, _ } | _ ] = projects_with_tasks_fixtures()

      project_ids =
        Tasks.list_tasks(project)
        |> Enum.map(&(&1.project_id))
        |> Enum.uniq()

      assert project_ids, [project.id]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{
        project_id: project_fixture().id,
        cancelled_at: ~N[2022-07-22 10:43:00],
        completed_at: ~N[2022-07-22 10:43:00],
        description: "some description",
        state: "some state",
        subject: "some subject"
      }

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.cancelled_at == ~N[2022-07-22 10:43:00]
      assert task.completed_at == ~N[2022-07-22 10:43:00]
      assert task.description == "some description"
      assert task.state == "some state"
      assert task.subject == "some subject"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{cancelled_at: ~N[2022-07-23 10:43:00], completed_at: ~N[2022-07-23 10:43:00], description: "some updated description", state: "some updated state", subject: "some updated subject"}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.cancelled_at == ~N[2022-07-23 10:43:00]
      assert task.completed_at == ~N[2022-07-23 10:43:00]
      assert task.description == "some updated description"
      assert task.state == "some updated state"
      assert task.subject == "some updated subject"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
