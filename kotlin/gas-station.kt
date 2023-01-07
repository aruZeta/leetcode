// Topics: Array, Greedy

data class BadStation(val end: Int, val gas: Int)

class Solution {
    fun canCompleteCircuit(gasArr: IntArray, cost: IntArray): Int {
        val completed: HashMap<Int, BadStation> = hashMapOf()
        var i = 0
        while (i < gasArr.size) {
            var j = i
            var gas = 0
            do {
                val gasLeft = gas + gasArr[j] - cost[j]
                val badStation = completed[j]
                if (badStation == null) {
                    if (gasLeft < 0) {
                        completed[i] = BadStation(j, -gasLeft)
                        i = j
                        gas = -1
                        break
                    } else gas = gasLeft
                } else {
                    if (gas < badStation.gas) {
                        gas = -1
                        break
                    } else {
                        gas -= badStation.gas
                        if (badStation.end == i - 1) break
                        j = badStation.end
                    }
                }
                j++
                if (j == gasArr.size) j = 0
            } while (j != i)
            if (gas >= 0) return i
            i++
        }
        return -1
    }
}
