defmodule SecretHandshake do

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = code
    |> to_binary

    result
  end



  def to_binary(input) do
    input
    |> Integer.digits(2)                                 # transform to binary
    # |> String.graphemes                                     # transform to list of strings
    |> Enum.reverse                                         # reverse list
    # |> Enum.map( fn x -> String.to_integer(x) end)          # string list to list of integers
    |> parse([], 0)
  end

  def parse([ 1 | tail ] = _list, result, 0 = _count), do: parse({tail, result ++ ["wink"], 1})
  def parse([ 0 | tail ] = _list, result, 0 = _count), do: parse({tail, result, 1})
  def parse({[ 1 | tail ], result, 1}), do: parse({tail, result ++ ["double blink"], 2})
  def parse({[ 0 | tail ], result, 1}), do: parse({tail, result, 2})
  def parse({[ 1 | tail ], result, 2}), do: parse({tail, result ++ ["close your eyes"], 3})
  def parse({[ 0 | tail ], result, 2}), do: parse({tail, result, 3})
  def parse({[ 1 | tail ], result, 3}), do: parse({tail, result ++ ["jump"], 4})
  def parse({[ 0 | tail ], result, 3}), do: parse({tail, result, 4})
  def parse({[ 1 | tail ], result, 4}), do: parse({tail, Enum.reverse(result), 5})
  def parse({[ 0 | tail ], result, 4}), do: parse({tail, result, 5})
  def parse({_, result, 5}), do: result        # meaningful digits are doneiex
  def parse({_list, result, _int}), do: result # list runs out
)



end
