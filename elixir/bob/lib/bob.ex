defmodule Bob do

  def hey(input) do
    input = String.trim input
    cond do
      silent?(input) -> "Fine. Be that way!"
      shouting?(input) && question?(input) && letters?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shouting?(input) && letters?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

defp silent?(input), do: input === ""
defp letters?(input), do: String.upcase(input) != String.downcase(input)
defp shouting?(input), do: String.upcase(input) === input
defp question?(input), do: String.ends_with?(input, "?")

end
