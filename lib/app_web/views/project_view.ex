defmodule ProjectManagerWeb.ProjectView do
  use ProjectManagerWeb, :view

  def format_time(time_to_format) do
    Calendar.strftime(time_to_format, "%H:%M %d %b %Y")
  end
end
