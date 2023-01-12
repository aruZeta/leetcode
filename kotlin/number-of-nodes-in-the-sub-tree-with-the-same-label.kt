// Topics: Hash Table, Tree, Depth-First Search, Breadth-First Search, Counting

class Solution {
    fun countSubTrees(n: Int, edges: Array<IntArray>, labels: String): IntArray {
        val result: IntArray = IntArray(n) { 0 }
        val tree: HashMap<Int, MutableSet<Int>> = HashMap(n)
        edges.forEach { edge ->
            tree[edge[0]]?.add(edge[1]) ?: tree.set(edge[0], mutableSetOf(edge[1]))
            tree[edge[1]]?.add(edge[0]) ?: tree.set(edge[1], mutableSetOf(edge[0]))
        }
        traverse_tree(tree, 0, -1, labels, result)
        return result
    }

    private fun HashMap<Char, Int>.mergeInto(into: HashMap<Char, Int>) =
        this.forEach { k, v -> into[k]?.let { into[k] = it + v } ?: into.set(k, v) }

    private fun traverse_tree(tree: HashMap<Int, MutableSet<Int>>, curr: Int, prev: Int, labels: String, result: IntArray): HashMap<Char, Int> {
        val current: HashMap<Char, Int> = hashMapOf(Pair(labels[curr], 1))
        tree[curr]!!.forEach { child -> if (child != prev) traverse_tree(tree, child, curr, labels, result).mergeInto(current) }
        result[curr] = current[labels[curr]]!!
        return current
    }
}
