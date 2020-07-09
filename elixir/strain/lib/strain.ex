defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  def keep(list, fun, state \\ [])
  def keep([], _fun, state) do
    state
  end
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([h | list], fun, state) do
    if apply(fun, h), do: state ++ h
    keep(list, fun, state)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    list -- keep(list, fun)
  end
end
