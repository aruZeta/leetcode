# Topics: Array, Hash Table, Prefix Sum

defmodule Solution do
  @spec subarrays_div_by_k(nums :: [integer], k :: integer) :: integer
  def subarrays_div_by_k(nums, k) do
    anti_neg = k * 1000
    nums
    |> Enum.reduce({0, 0, %{0 => 1}}, fn n, {ans, acc, mods} ->
      acc = rem(acc + anti_neg + n, k)
      {ans + Map.get(mods, acc, 0), acc, mods |> Map.update(acc, 1, &(&1 + 1))}
    end)
    |> elem(0)
  end
end
