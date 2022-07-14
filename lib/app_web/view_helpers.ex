defmodule ProjectManagerWeb.ViewHelpers do
  @moduledoc """
  Common view helpers used in multiple contexts
  """

  def format_time(time_to_format) do
    Calendar.strftime(time_to_format, "%H:%M %d %b %Y")
  end
end
