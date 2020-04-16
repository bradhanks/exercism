defmodule WordCount do
  @doc """
  Count the number of words in the sentence.
  Words are compared case-insensitively.
  """

  def count(sentence) do

    sentence
    |> String.downcase
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)                                   # creates a list of words
                                                                                      # trims out empty list items
                                                                                      # regex:
                                                                                      # >> single space not alphanumeric or a hyphen
                                                                                      # >> unicode support solves German character problem
    |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, (&(&1 + 1))) end)

    # |> Enum.reduce(%{}, (&Map.update(&2, &1, 1, (&(&1 + 1))))) # <-- familed attempt to further simplify function

  end


end
