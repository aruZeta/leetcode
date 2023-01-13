# Topics: Array, String, Tree, Depth-First Search, Graph, Topological Sort

defmodule Solution do
  @spec longest_path(parent :: [integer], s :: String.t) :: integer
  def longest_path([ ph | pt ], s) do
    pt
    |> to_tree(1, %{})
    |> traverse(0, s, 1)
    |> fn { _, rs, _ } -> rs end.()
  end

  def traverse(tree, curr, s, rs) do
    l_curr = s |> :binary.at curr
    tree
    |> Map.get(curr, [])
    |> Enum.reduce({ 0, 0, rs }, fn child, { n1, n2, rs } ->
      { m, rs_child, l_child } = traverse(tree, child, s, rs)
        if l_child == l_curr do
          { n1, n2, rs_child }
        else
          [n1, n2, m]
          |> Enum.sort(&>=/2)
          |> fn [n1, n2, _] -> {n1, n2, rs_child} end.()
        end
    end)
    |> fn { n1, n2, rs } -> { n1 + 1, max(rs, n1 + n2 + 1), l_curr } end.()
  end

  defp to_tree([ ph | pt ], i, s),
    do: to_tree(pt, i+1, s
      |> Map.update(ph, [i], &([i | &1]))
    )

  defp to_tree([], _, s),
    do: s
end

# Someone doesn't know how to read and made it with different characters
# in the whole subtree ...

defmodule Solution do
  @spec longest_path(parent :: [integer], s :: String.t) :: integer
  def longest_path([ ph | pt ], s) do
    pt
    |> to_tree(1, %{})
    |> traverse(0, s)
    |> fn { rs, rs_inner } ->
      rs |> Enum.reduce(rs_inner, fn { n, _ }, acc -> max(n, acc) end)
    end.()
  end

  def traverse(tree, curr, s) do
    l = s |> :binary.at curr
    this = MapSet.new([l])
    tree
    |> Map.get(curr, [])
    |> Enum.reduce({[], 0}, fn child, {path_acc, inner_acc} ->
      { path, inner } = traverse(tree, child, s)
      { path ++ path_acc, max(inner, inner_acc) }
    end)
    |> check_paths(l)
    |> check_inner_paths(l)
    |> fn { rs, rs_inner } ->{ [ { 1, this } | rs ], rs_inner } end.()
  end

  defp check_paths({ path, inner }, l),
    do: check_paths(path, l, [], inner)

  defp check_paths([ ph | pt ], l, rs, rs_inner) do
    { phn, phs } = ph
    if MapSet.member?(phs, l),
      do: check_paths(pt, l, rs, max(phn, rs_inner)),
      else: check_paths(pt, l, [ ph | rs ], rs_inner)
  end

  defp check_paths([], _, rs, rs_inner),
    do: { rs, rs_inner }

  defp check_inner_paths({ [ { phn, phs } | pt ], rs_inner }, l),
    do: check_inner_paths(phn, phs, pt, l, [], rs_inner)

  defp check_inner_paths(pn, ps, [ { phn, phs } | pt ], l, rs, rs_inner) do
    rs = [ { pn + 1, MapSet.put(ps, l) } | rs ]
    if MapSet.disjoint?(ps, phs),
      do: check_inner_paths(phn, phs, pt, l, rs, max(pn + phn + 1, rs_inner)),
      else: check_inner_paths(phn, phs, pt, l, rs, rs_inner)
  end

  defp check_inner_paths(pn, ps, [], l, rs, rs_inner),
    do: { [ { pn + 1, MapSet.put(ps, l) } | rs ], rs_inner }

  defp check_inner_paths(rs, _),
    do: rs

  defp to_tree([ ph | pt ], i, s),
    do: to_tree(pt, i+1, s
      |> Map.update(ph, [i], &([i | &1]))
    )

  defp to_tree([], _, s),
    do: s

end
