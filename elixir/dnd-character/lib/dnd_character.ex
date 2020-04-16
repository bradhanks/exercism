defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a


  def character do
    character = %__MODULE__{}
    |> Map.put(:strength, ability())
    |> Map.put(:dexterity, ability())
    |> Map.put(:constitution, ability())
    |> Map.put(:intelligence, ability())
    |> Map.put(:wisdom, ability())
    |> Map.put(:charisma, ability())

    Map.put(character, :hitpoints, 10 + modifier(Map.get(character, :constitution)))
  end

  @spec modifier(pos_integer()) :: integer()
  def modifier(con) when (con - 10)/2 >= 0 do
    trunc((con - 10) / 2)
  end

  def modifier(con) when (con - 10)/2 < 0 do
    round((con - 10) / 2)
  end

  @spec ability :: pos_integer()
  def ability() do
    high_rolls() |> sum_high_rolls
  end

  def roll, do: Enum.random(1..6)
  def rolls, do: [roll(), roll(), roll(), roll()]
  def high_rolls do
    r = rolls()
    List.delete(r, Enum.min(r))
  end
  def sum_high_rolls(high_rolls) do
    Enum.reduce(high_rolls, &(&1+&2))
  end


end
