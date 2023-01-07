# Contest: Biweekly 95

# Notes:
# first ever contest I've made, I opened this problem around an hour ago
# and left, didn't know it would count the time since then lol.
# Also funny how when I submitted it I forgot a `>=` and had `>`, GG.

defmodule Solution do
  @spec categorize_box(length :: integer, width :: integer, height :: integer, mass :: integer) :: String.t
  def categorize_box(length, width, height, mass) do
    case {
      (length >= 10000 or width >= 10000 or height >= 10000 or length * width * height >= 1000000000),
      (mass >= 100)
    } do
      {true, true} -> "Both"
      {true, false} -> "Bulky"
      {false, true} -> "Heavy"
      {false, false} -> "Neither"
    end
  end
end
