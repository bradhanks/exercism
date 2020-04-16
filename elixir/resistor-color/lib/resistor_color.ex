defmodule ResistorColor do

  @colors  [black: 0,
            brown: 1,
            red: 2,
            orange: 3,
            yellow: 4,
            green: 5,
            blue: 6,
            violet: 7,
            grey: 8,
            white: 9]
  @moduledoc false

  def colors do
    Enum.map(@colors, (fn {x, _y} -> Atom.to_string(x) end)) # transverse list :atom -> "atom"
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    stuff = color |> String.to_atom
    {_color, code} = Enum.find(@colors, fn {x, _y} -> x == stuff end)

    code
  end
end
