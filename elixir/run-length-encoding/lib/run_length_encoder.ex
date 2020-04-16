defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.to_list
    |> Enum.chunk_while(acc, chuck_func, after_func )
  end

  def chunk_func = fn
    x, acc when acc = []
           when x = acc.last
      -> acc
    _ ->
    end
  def count_chunk(string) do

  end


  @spec decode(String.t()) :: String.t()
  def decode(string) do
  end
end
