# Contest: Biweekly 96

defmodule Solution do
  @spec get_common(n1 :: [integer], n2 :: [integer]) :: integer
  def get_common([ nh1 | nt1 ] = n1, [ nh2 | nt2 ] = n2) do
    cond do
      nh1 == nh2 -> nh1
      nh1 < nh2 -> get_common(nt1, n2)
      nh1 > nh2 -> get_common(n1, nt2)
    end
  end
  
  def get_common(_, _),
    do: -1
end
