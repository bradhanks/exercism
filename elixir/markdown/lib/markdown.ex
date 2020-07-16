defmodule Markdown do
  @spec parse(String.t()) :: String.t()
  def parse(string) do
    string
    |> String.split("\n")
    |> Enum.map(fn line -> parse_line(line) end)
    |> Enum.join()
    |> String.replace("<li>", "<ul>" <> "<li>", global: false)
    |> String.replace_suffix("</li>", "</li>" <> "</ul>")
  end

  defp parse_line("#" <> _tail = line), do: line |> String.split |> add_header
  defp parse_line("* " <> tail), do: tail |> String.split |> wrap_line("li")
  defp parse_line(line), do: line |> String.split |> wrap_line("p")

  defp wrap_line(words, tag), do: "<" <> tag <> ">" <> parse_words(words) <> "</" <> tag <> ">"

  defp parse_words(words), do: words |> Enum.map(fn word -> parse_word(word, String.reverse(word)) end) |> Enum.join(" ")

  defp parse_word("__" <> word, _rev), do: "<strong>" <> parse_word(word, String.reverse(word))
  defp parse_word("_" <> word, _rev), do: "<em>" <> parse_word(word, String.reverse(word))
  defp parse_word(_word, "__" <> rev), do: String.reverse(rev) <> "</strong>"
  defp parse_word(_word, "_" <> rev), do: String.reverse(rev) <> "</em>"
  defp parse_word(word, _rev), do: word

  defp add_header([h | t]), do: wrap_line(t, "h" <> to_string(String.length(h)))
end
