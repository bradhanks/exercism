defmodule Bob do
  @bobsays [
    {question: "Sure."},
    {yell: "Whoa, chill out!"},
    {yellquestion: "Calm down, I know what I'm doing!"},
    {whitespace: "Fine. Be that way!"},
    {default: "Whatever."}
  ]

  def hey(input) do
    cond do
      true -> raise "Your implementation goes here"
    end
  end
end
