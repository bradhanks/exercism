defmodule Bob do
  @messages       [
                    {~r/^(?(?=\b[A-Z]+\b).*)\?$/, "Calm down, I know what I'm doing!"},
                    {~r/^.*\?$/, "Sure."},
                    {~r/^[\W]*$/, "Fine. Be that way!"},
                    {~r/^\b[A-Z]+\b.*$/, "Whoa, chill out!"},
                    {~r/^[^a-z]+!$/, "Whoa, chill out!"},
                    {~r/^[^a-z0-9]+$/, "Whoa, chill out!"},
                    {~r/^.*/, "Whatever."}

                  ]

  def hey(input), do: reply(input)

  def reply(msg) do
    msg |> String.trim |> parse(@messages, "", _match_found = false)
  end

  defp parse(_msg, _messages, reply, true) do
    reply
  end

  defp parse(msg, [{regex, response} | tail], _reply, _match_found) do
    parse(msg, tail, response, Regex.match?(regex, msg))
  end

end
