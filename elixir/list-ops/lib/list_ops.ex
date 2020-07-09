defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(list \\ [], i \\ 0)
  def count([],i), do: i
  def count([ _h | t ], i), do: count(t, i + 1)

  @spec reverse(list, revlist) :: list
  def reverse(list \\ [], revlist \\ [])
  def reverse([], revlist), do: revlist
  def reverse([ h | t ], revlist), do: reverse(t, append(revlist, h))
  end

  @spec map(list, (any -> any)) :: list
  def map(l \\ [], f \\ fn x -> x end, newl \\ [])
  def map([], f, newl), do: newl
  def map([h | t ], f, newl), do: map(t, f, append(newl, f.(h))

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l \\ [], f \\ fn x -> x%1 == 0 end)
  def filter([], f, newl), do: newl
  def filter([h | t ], f, newl), do: map(t, f, append(newl, f.(h))

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list \\ [], fn(x, fn ) ->
  def reduce([h | t], acc, acc.(h, acc.(t))) do
  end

  @spec append(list, list) :: list
  def append(a, b) do
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
  end
end
