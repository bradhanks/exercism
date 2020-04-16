defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> String.to_charlist
    |> Enum.chunk_every(3)
    |> Enum.map(&codon_map/1)


  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  defp of_codon(codon) do
    return =  codon |> String.to_charlist |> codon_map
    {:ok, return}
  end

  def codon_map(codon) do
    case codon do
      'UGU' -> "Cysteine"
      'UGC' -> "Cysteine"
      'UUA' -> "Leucine"
      'UUG' -> "Leucine"
      'AUG' -> "Methionine"
      'UUU' -> "Phenylalanine"
      'UUC' -> "Phenylalanine"
      'UCU' -> "Serine"
      'UCC' -> "Serine"
      'UCA' -> "Serine"
      'UCG' -> "Serine"
      'UGG' -> "Tryptophan"
      'UAU' -> "Tyrosine"
      'UAC' -> "Tyrosine"
      'UAA' -> "STOP"
      'UAG' -> "STOP"
      'UGA' -> "STOP"
    end
  end

end
