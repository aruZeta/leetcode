# Contest: Biweekly 96

defmodule Solution do
  @spec min_operations(n1 :: [integer], n2 :: [integer], k :: integer) :: integer
  def min_operations(n1, n2, k),
    do: min_operations(n1, n2, k, 0, 0, 0)

  def min_operations([ nh1 | nt1 ], [ nh2 | nt2 ], k, s, d, acc) do
    diff = (nh1 - nh2) |> abs
    cond do
      diff == 0 -> min_operations(nt1, nt2, k, s, d, acc)
      k == 0 -> -1
      rem(diff, k) == 0 ->
        c = div(diff, k)
        cond do
          nh1 > nh2 ->
            d = d - c
            sn = s + max(-d, 0)
            d = max(d, 0)
            min_operations(nt1, nt2, k, sn, d, acc + (sn - s))
          true ->
            s = s - c
            dn = d + max(-s, 0)
            s = max(s, 0)
            min_operations(nt1, nt2, k, s, dn, acc + (dn - d))
        end
      true -> -1
    end
  end
    
  def min_operations(_, _, _, s, d, acc)
    when s == d,
    do: acc
           
  def min_operations(_, _, _, _, _, _),
    do: -1
end
