defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @twelve_days %{   1 => {"first", "a Partridge in a Pear Tree."},
                    2 => {"second", "two Turtle Doves"},
                    3 => {"third", "three French Hens"},
                    4 => {"fourth", "four Calling Birds"},
                    5 => {"fifth", "five Gold Rings"},
                    6 => {"sixth", "six Geese-a-Laying"},
                    7 => {"seventh", "seven Swans-a-Swimming"},
                    8 => {"eighth", "eight Maids-a-Milking"},
                    9 => {"nineth", "nine Ladies Dancing"},
                    10 =>{"tenth", "ten Lords-a-Leaping"},
                    11 =>{"eleventh", "eleven Pipers Piping"},
                    12 =>{"twelveth",  "twelve Drummers Drumming"}
                }

  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    {day, gift} = Map.get(@twelve_days, number)
    Enum.reduce(list, "", fn x, acc -> acc + ", ")
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
  end

  def intro(cardinal), do: "On the #{cardinal} day of Christmas my true love gave to me:"
  def get_gift(int), do: Map.get(@twelve_days, int) |> Tuple.to_list |> List.last

  end


end
