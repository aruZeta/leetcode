# Topics: Tree, Depth-First Search, Breadth-First Search, Binary Tree

# Note:
# Actually the solution can be as simple as:
# ```
# defmodule Solution do
#   @spec is_same_tree(p :: TreeNode.t | nil, q :: TreeNode.t | nil) :: boolean
#   def is_same_tree(p, q), do: p == q
# end
# ```
# I mean, so cool

# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
  def is_same_tree(
    %TreeNode{val: pv, left: pl, right: pr},
    %TreeNode{val: qv, left: ql, right: qr}
  ), do: pv == qv and is_same_tree(pl, ql) and is_same_tree(pr, qr)

  def is_same_tree(nil, nil), do: true
  def is_same_tree(_, nil), do: false
  def is_same_tree(nil, _), do: false
end
