defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  defp change(?G), do: ?C
  defp change(?C), do: ?G
  defp change(?A), do: ?U
  defp change(?T), do: ?A

  def to_rna(dna) do
    Enum.map(dna, &change/1)

  end

end
