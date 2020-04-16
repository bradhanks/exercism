defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  def rotate(text, shift) do
    text <> <<0>>                             # add <<0>> so it can't be expressed as string, forcing codepoints
    |> String.to_charlist                     # change codepoints to list
    |> Enum.map(&(new_codepoint(&1, shift)))  # run new_codepoint on each list item
    |> Enum.drop(-1)                          # get rid of the zero
    |> List.to_string                         # charlist -> string

  end

  #uppercase letters that go back around through "Z"
  @spec new_codepoint(any, any) :: any
  def new_codepoint(codepoint, key) when codepoint <= 90 and codepoint + key > 90  do
    codepoint + key - 90 + 65 - 1
  end

  #lowercase letters that go back around through "z"
  def new_codepoint(codepoint, key) when codepoint <= 122 and codepoint >= 97 and codepoint + key > 122  do
    codepoint + key - 122 + 97 - 1
  end

  #valid letters
  def new_codepoint(codepoint, key)
    when codepoint >= 65 and codepoint <= 90
    when codepoint >= 97 and codepoint <= 122,
    do: codepoint + key

  # anything else doesn't get changes (0, blank spaces)
  def new_codepoint(codepoint, _key), do: codepoint
end
