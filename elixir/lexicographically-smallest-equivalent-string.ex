defmodule Solution do
  @spec smallest_equivalent_string(s1 :: String.t, s2 :: String.t, base_str :: String.t) :: String.t
  def smallest_equivalent_string(s1, s2, base_str) do
    base_str
    |> s_foldr(to_tree(s1, s2))
  end

  defp to_tree(<< s1h, s1t::binary >>, << s2h, s2t::binary >>),
    do: to_tree(s1t, s2t) |> tree_union(s1h, s2h)

  defp to_tree(_, _),
    do: %{}

  defp s_foldr(<< sh, st::binary >>, tree),
    do: << tree |> find_root(sh) |> elem(0) >> <> s_foldr(st, tree)
    # Here I wanted to do: << (tree |> find_root(sh) |> elem(0)), s_foldr(st, tree) >>
    # But it's giving an error of illegal arguments?
    # Trying something like << 97, "bcd" >> works giving "abcd", so IDK

  defp s_foldr(_, _),
    do: ""

  def tree_union(tree, child1, child2) do
    {root1, tree} = tree |> find_root(child1)
    {root2, tree} = tree |> find_root(child2)
    cond do
      root1 == root2 -> tree
      root1 < root2 -> tree |> Map.put(root2, root1)
      true -> tree |> Map.put(root1, root2)
    end
  end

  def find_root(tree, child) do
    root = tree[child]
    case root do
      nil -> {child, tree |> Map.put(child, child)}
      ^child -> {child, tree}
      _ -> tree |> find_root(root)
    end
  end
end
