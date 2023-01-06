// Topics: Array, Greedy, Sorting

class Solution {
    fun maxIceCream(costs: IntArray, coins: Int): Int {
        costs.sort()
        var rem = coins
        var result = 0
        for (cost in costs) {
            if (rem < cost) break
            rem -= cost
            result++
        }
        return result
    }
}
