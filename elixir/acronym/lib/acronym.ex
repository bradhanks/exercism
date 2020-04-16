defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\-\s]+/)
    |> Enum.map(&String.trim(&1, "_"))
    |> Enum.map(&String.split(&1, ~r/(?<=[a-z])(?=[A-Z])/)) |> Enum.flat_map(&(&1))
    |> Enum.map(&String.first/1)
    |> Enum.reverse
    |> Enum.reduce(&(&1<>&2))
    |> String.upcase
  end

end
