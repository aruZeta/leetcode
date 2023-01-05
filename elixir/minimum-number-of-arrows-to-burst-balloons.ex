# Topics: Array, Greedy, Sorting

defmodule Solution do
  @spec find_min_arrow_shots(points :: [[integer]]) :: integer
  def find_min_arrow_shots(points) do
    Enum.sort_by(points, fn([ _, xe ]) -> xe end)
    |> (fn([[ _, xe ] | t]) -> find_min_arrow_shots(t, 1, xe) end).()
  end

  def find_min_arrow_shots([[ xs, xe ] | t], count, max) do
    if xs <= max,
    do: find_min_arrow_shots(t, count, max),
    else: find_min_arrow_shots(t, count + 1, xe)
  end

  def find_min_arrow_shots([], count, _), do: count
end
