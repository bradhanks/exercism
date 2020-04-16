defmodule SecretHandshake.RageQuit do

  alias __MODULE__, as: SH

  defstruct(wink:             false,
            double_blink:     false,
            close_your_eyes:  false,
            jump:             false,
            reverse:          false,
            tail:             []
            )
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
    code
    |> to_binary
    |> check_wink()
    |> check_double_blink()
    |> check_close_your_eyes()
    |> check_jump()
    |> check_reverse()
    |> parse_struct()
  end



  def to_binary(input) do
    list  = input
    |> Integer.to_string(2)                                 # transform to binary
    |> String.graphemes                                     # transform to list of strings
    |> Enum.reverse                                         # reverse list
    |> Enum.map( fn x -> String.to_integer(x) end)          # string list to list of integers

    {list, %SH{}}                                           # return tuple {list of integers, default struct}
  end

  def check_wink({[ 1 | tail], %SH{} = map}) do             # if the ones value is 1 then this function matches
    map =
    Map.put(map, :wink, true)
    |> Map.put(:tail, tail)
    # map =  %SH{wink: true, tail: tail}
    {tail, map}
  end

  def check_wink({[_h | tail], %SH{} = _map}) do
   map =  %SH{tail: tail}

  {tail, map}

  end

  def check_wink({[], map}), do: {[], map}

  def check_double_blink({[ 1 | tail] = [ _head | tail ], %SH{} = map}) do
    map = Map.put(map, :double_blink, true) |> Map.put(:tail, tail)

    {tail, map}

  end

  def check_double_blink({[_h | tail], %SH{} = map}) do
    map = Map.put(map, :tail, tail)

    {tail, map}

  end

  def check_double_blink({[], map}), do: {[], map}

  def check_close_your_eyes({[ 1 | tail] = [ _head | tail ], %SH{} = map}) do
    map = Map.put(map, :close_your_eyes, true) |> Map.put(:tail, tail)

    {tail, map}
  end

  def check_close_your_eyes({[_h | tail], %SH{} = map}) do
    map = Map.put(map, :tail, tail)

    {tail, map}
  end
  def check_close_your_eyes({[], map}), do: {[], map}

  def check_jump({[ 1 | tail] = [ _head | tail ], %SH{} = map}) do
    map = Map.put(map, :jump, true) |> Map.put(:tail, tail)
      {tail, map}
  end

  def check_jump({[_h | tail], %SH{} = map}) do
    map = Map.put(map, :tail, tail)
    {tail, map}
  end
  def check_jump({[], map}), do: {[], map}

  def check_reverse({[ 1 | tail] = [ _head | tail ], %SH{} = map}) do
    Enum.reverse(map)
  end

  def check_reverse({[_h | tail], %SH{} = map}) do
    map = Map.put(map, :tail, tail)
    map
  end
  def check_reverse({[], map}), do: map

  def parse_struct(%SH{} = map) do
    Map.from_struct(map)                                                    # transforms struct to map
    |> Enum.filter( fn {_key, value} -> value == true end )                 # keep only truthy values
    |> Enum.reduce( [], fn {x, _y}, acc -> [Atom.to_string(x)] ++ acc end)  # Strip out value from key-value pair and convert to list of strings

  end

end
