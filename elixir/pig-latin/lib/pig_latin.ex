defmodule PigLatin do

  @vowels [ "a", "e", "i", "o", "u", "yt", "xr" ]
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(&(pig_logic(&1)))
    |> List.to_string

  end

  def pig_logic(word) do
    word
    |> consonant_check
    |> move_consonant(bool)
    |> add_ay
  end

  def consonant_check(word) do
    case  do
      Regex. ->

    end

  end
  def add_ay(word), do: word <> "ay"

  def move_consonants(word, true) do
    word
    |> String.split(@vowels, parts: 2)
    |> switcheroo
  end

  def move_consonants(word, false), do: word

  def switcheroo([first, second]) do
    second <> first
  end


end
