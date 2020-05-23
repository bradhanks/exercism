defmodule Bob do

@functions [isquestion(x),
            isyell(x),
            isangryquestion(x),
            ]

  def reply(msg) do
    msg
    |> String.trim |> parse(@messages, "", _match_found = false)
  end
  def isquestion(msg) do
    msg
    |>String.trim
    |>String.ends_with?("?")
  end

  def isangryquestion(msg), do: isquestion(msg) && isangry(msg)
  def isangry(msg), do: msg == String.upcase(msg)
  def isyell


end
