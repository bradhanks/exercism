defmodule RobotSimulator do

  alias RobotSimulator, as: Bot
  defstruct direction: :north, position: {0,0}

  defguard not_two_tuple(position) when not(is_tuple(position)) or tuple_size(position) != 2
  defguard not_tuple_integer(position) when not(is_integer(elem(position,0))) or not(is_integer(elem(position,1)))
  defguard invalid_position(position) when not_two_tuple(position) or not_tuple_integer(position)

  @doc """
  Create a Robot Simulator given an initial direction and position.
  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom(), position :: {integer, integer}) :: struct()
  def create(direction \\ :north, position \\ {0, 0})
  def create(_direction, position) when invalid_position(position), do: {:error, "invalid position"}
  def create(:north, {x,y}), do: %{ %Bot{} | direction: :north, position: {x,y}}
  def create(:south, {x,y}), do: %{ %Bot{} | direction: :south, position: {x,y}}
  def create(:east,  {x,y}), do: %{ %Bot{} | direction: :east, position: {x,y}}
  def create(:west,  {x,y}), do: %{ %Bot{} | direction: :west, position: {x,y}}
  def create(_direction, _position), do: {:error, "invalid direction"}

  @spec simulate(robot ::  struct(), instructions :: String.t()) :: struct()
  def simulate(%RobotSimulator{} = robot, instructions) do
    instructions
    |> String.codepoints
    |>(&move(robot, &1)).()
  end
  @doc """
  Simulate the robot's movement given a string of instructions.
  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  def move(%Bot{} = robot, []), do: robot
  def move(%Bot{direction: :north} = robot, ["L" | instructions]), do: %{robot | direction: :west}  |> move(instructions)
  def move(%Bot{direction: :south} = robot, ["L" | instructions]), do: %{robot | direction: :east}  |> move(instructions)
  def move(%Bot{direction: :east}  = robot, ["L" | instructions]), do: %{robot | direction: :north} |> move(instructions)
  def move(%Bot{direction: :west}  = robot, ["L" | instructions]), do: %{robot | direction: :south} |> move(instructions)
  def move(%Bot{direction: :north} = robot, ["R" | instructions]), do: %{robot | direction: :east}  |> move(instructions)
  def move(%Bot{direction: :south} = robot, ["R" | instructions]), do: %{robot | direction: :west}  |> move(instructions)
  def move(%Bot{direction: :east}  = robot, ["R" | instructions]), do: %{robot | direction: :south} |> move(instructions)
  def move(%Bot{direction: :west}  = robot, ["R" | instructions]), do: %{robot | direction: :north} |> move(instructions)
  def move(%Bot{direction: :north, position: {x,y}} = robot, ["A" | instructions]), do: %{robot | position: {x, y+1}} |> move(instructions)
  def move(%Bot{direction: :south, position: {x,y}} = robot, ["A" | instructions]), do: %{robot | position: {x, y-1}} |> move(instructions)
  def move(%Bot{direction: :east,  position: {x,y}} = robot, ["A" | instructions]), do: %{robot | position: {x+1, y}} |> move(instructions)
  def move(%Bot{direction: :west,  position: {x,y}} = robot, ["A" | instructions]), do: %{robot | position: {x-1, y}} |> move(instructions)
  def move(_robot, _instructions), do: {:error, "invalid instruction"}
  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: struct()) :: :north | :east | :south | :west
  def direction(%Bot{direction: direction}), do: direction
  def direction(_robot), do: {:error, "Not a valid robot"}
  @doc """
  Return the robot's position.
  """
  @spec position(robot :: struct()) :: {integer, integer}
  def position(%Bot{position: {x, y}}), do: {x,y}
  def position(_robot), do: {:error, "Not a valid robot"}
end
