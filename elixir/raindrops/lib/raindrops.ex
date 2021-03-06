defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @divisors %{ 3 => "Pling",
              5 => "Plang",
              7 => "Plong"
            }

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    @divisors
    |> Map.keys
    |> Enum.filter(&(rem(number, &1) == 0))
    |> Enum.reverse
    |> Enum.map(&build/1)
    |> reduce(number)

  end
  # don't code defensively
  def build(number), do: Map.get(@divisors, number)

  def reduce([] = _list, number), do: Integer.to_string(number)
  def reduce(list, _number), do: list |> Enum.reduce(&(&1<>&2))

end
