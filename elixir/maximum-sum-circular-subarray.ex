# Topics: Array, Divide and Conquer, Dynamic Programming, Queue, Monotonic Queue

defmodule Solution do
  @spec max_subarray_sum_circular(nums :: [integer]) :: integer
  def max_subarray_sum_circular(nums) do
    nums
    |> Enum.reduce({0, 0, 0, -30000, 30000}, fn n, {sum_t, sum_1, sum_2, sum_max, sum_min} ->
      sum_1 = sum_1 + n
      sum_2 = sum_2 + n
      {
        sum_t + n,
        (if sum_1 < 0, do: 0, else: sum_1),
        (if sum_2 > 0, do: 0, else: sum_2),
        max(sum_max, sum_1),
        min(sum_min, sum_2)
      }
    end)
    |> fn {sum_t, sum_1, sum_2, sum_max, sum_min} ->
      if sum_t == sum_min,
        do: sum_max,
        else: max(sum_max, sum_t - sum_min)
    end.()
  end
end
