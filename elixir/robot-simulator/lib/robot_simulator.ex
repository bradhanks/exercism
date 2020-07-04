defmodule RobotSimulator do

  defstruct direction: :north, position: {0,0}

  @doc """
  Create a Robot Simulator given an initial direction and position.
  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom(), position :: {integer, integer}) :: struct()
  def create(direction \\ :north, position \\ {0, 0})
  def create(_direction, position) when not(is_tuple(position))
                                        or tuple_size(position) != 2
                                        or not(is_integer(elem(position,0)))
                                        or not(is_integer(elem(position,1))), do: {:error, "invalid position"}
  def create(:north, {x,y}), do: %{ %RobotSimulator{} | direction: :north, position: {x,y}}
  def create(:south, {x,y}), do: %{ %RobotSimulator{} | direction: :south, position: {x,y}}
  def create(:east, {x,y}), do: %{ %RobotSimulator{} | direction: :east, position: {x,y}}
  def create(:west, {x,y}), do: %{ %RobotSimulator{} | direction: :west, position: {x,y}}
  def create(_direction, _pos), do: {:error, "invalid direction"}

  def pos_check(position), do: not(is_tuple(position)) or tuple_size(position) != 2 or not(is_integer(elem(position,0))) or not(is_integer(elem(position,1)))
  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """

  def move([], robot), do: robot
  def move(["L" | list], %RobotSimulator{direction: direction} = robot) do
    direction
    |> left_rotate
    |> (&%RobotSimulator{robot | direction: &1}).()
    |> (&move(list, &1)).()
  end
  def move(["R" | list], %RobotSimulator{direction: direction} = robot) do
    direction
    |> right_rotate
    |> (&%RobotSimulator{robot | direction: &1}).()
    |> (&move(list, &1)).()
  end
  def move(["A" | list], %RobotSimulator{direction: direction, position: position} = robot) do
    position
    |> update_pos(direction)
    |> (&%RobotSimulator{robot | position: &1}).()
    |> (&move(list, &1)).()
  end

  def move([ _head | _list], _robot), do: {:error, "invalid instruction"}

  @spec simulate(robot ::  struct(), instructions :: String.t()) :: struct()
  def simulate(robot = %RobotSimulator{}, instructions) do
    instructions
    |> String.codepoints
    |> move(robot)
  end

  @spec update_pos( position :: {integer,integer}, direction :: :north | :east | :south | :west) :: {integer, integer}
  def update_pos({x,y}, :north), do: {x, y+1}
  def update_pos({x,y}, :south), do: {x, y-1}
  def update_pos({x,y}, :east), do: {x+1, y}
  def update_pos({x,y}, :west), do: {x-1, y}

  @spec left_rotate(direction :: :north | :east | :south | :west) :: :north | :east | :south | :west
  def left_rotate(:north), do: :west
  def left_rotate(:south), do: :east
  def left_rotate(:east), do: :north
  def left_rotate(:west), do: :south

  @spec right_rotate(direction :: :north | :east | :south | :west) :: :north | :east | :south | :west
  def right_rotate(:north), do: :east
  def right_rotate(:south), do: :west
  def right_rotate(:east), do: :south
  def right_rotate(:west), do: :north

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: struct()) :: :north | :east | :south | :west
  def direction(%RobotSimulator{direction: direction} = _robot), do: direction
  def direction(robot), do: robot

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: struct()) :: {integer, integer}
  def position(%RobotSimulator{position: {x, y}} = _robot), do: {x,y}
  def position(robot), do: robot
end
