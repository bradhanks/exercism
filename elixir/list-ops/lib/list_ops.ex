defmodule ListOps do
  def count(list \\ [], i \\ 0)
  def count([],i), do: i
  def count([_h | t], i), do: count(t, i+1)
  def reverse(list), do: list |> reduce([], &[&1| &2])
  def map(list, fun), do: list |> reverse() |> reduce([], &[fun.(&1) | &2])
  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list \\ [], f \\ fn x -> x == 0 end, newlist \\ [])
  def filter([], _f, newlist), do: reverse(newlist)
  def filter([h | t ], f, newlist) do
    if f.(h) do
      filter(t, f, [h | newlist])
    else
      filter(t, f, newlist)
    end
  end
  def reduce([], acc, _fun), do: acc
  def reduce([h | t], acc, fun), do: h |> fun.(acc) |> (&(reduce(t, &1, fun))).()
  def append(a, b), do: a |> reverse |> reduce(b, &[&1 | &2])
  def concat(a), do: a |> reverse |> reduce([], &append(&1, &2))
end
