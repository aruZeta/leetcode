# Topics: Hash Table, Tree, Depth-First Search, Breadth-First Search

defmodule Solution do
  @spec min_time(n :: integer, edges :: [[integer]], has_apple :: [boolean]) :: integer
  def min_time(n, edges, has_apple) do
    edges
    |> Enum.reduce(%{}, fn [a, b], acc ->
      acc
      |> Map.update(a, [b], &([b | &1]))
      |> Map.update(b, [a], &([a | &1]))
    end)
    |> traverse_tree(0, -1, has_apple |> apple_nodes(MapSet.new(), 0))
    |> fn x -> if x > 0, do: x - 2, else: 0 end.()
  end

  defp traverse_tree(tree, curr, prev, apples) do
    Map.get(tree, curr, [])
    |> Enum.reduce(0, fn child, acc ->
      acc + if child == prev,
        do: 0,
        else: traverse_tree(tree, child, curr, apples)
    end)
    |> fn n -> (cond do
      n > 0 -> n + 2
      MapSet.member?(apples, curr) -> 2
      true -> 0
    end) end.()
  end

  defp apple_nodes([ head | tail ], s, n)
    when head,
    do: apple_nodes(tail, MapSet.put(s, n), n + 1)

  defp apple_nodes([ _ | tail], s, n),
    do: apple_nodes(tail, s, n + 1)

  defp apple_nodes(_, res, _),
    do: res
end
