# Topics: String, Dynamic Programming

defmodule Solution do
  @spec min_flips_mono_incr(s :: String.t) :: integer
  def min_flips_mono_incr(s),
    do: s |> algo(0) |> elem(1)

  def algo(<< sh, st::binary-size(0) >>, ones),
    do: { (if sh == ?1, do: 0, else: 1), ones }

  def algo(<< sh, st::binary >>, ones) do
    if sh == ?1 do
      { zeroes, min } = algo(st, ones + 1)
      { zeroes, min(min, ones + zeroes) }
    else
      { zeroes, min } = algo(st, ones)
      { zeroes + 1, min(min, ones + zeroes) }
    end
  end
end
