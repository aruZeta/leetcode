# Topics: Array, Hash Table, Math, Geometry

defmodule Solution do
  def max_points([ h | t ], max \\ 0) do
    max_points(t, h, %{}, 1)
    |> fn r -> max_points(t, (if r > max, do: r, else: max)) end.()
  end

  def max_points([], max), do: max

  def max_points([ [hx, hy] | t ], [px, py], ps, max) do
    slope = {
      px - hx,
      py - hy
    } |> fn { x, y } -> {
      div(x, Integer.gcd(x, y)),
      div(y, Integer.gcd(x, y))
    } end.() |> fn { xf, yf } -> (cond do
      xf == 0 -> { 0, 1 }
      yf == 0 -> { 1, 0 }
      (xf < 0 and yf < 0) or yf < 0 -> { -xf, -yf }
      true -> { xf, yf }
    end) end.()
    count = case ps[slope] do
      nil -> 1
      n -> n
    end + 1
    max_points(
      t,
      [px, py],
      Map.put(ps, slope, count), (if count > max, do: count, else: max)
    )    
  end

  def max_points([], _, _, max), do: max
end
