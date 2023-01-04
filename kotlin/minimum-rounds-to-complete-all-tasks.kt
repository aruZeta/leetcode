// Topics: Array, Hash Table, Greedy, Counting

class Solution {
    operator fun Int?.plus(v: Int) = this?.plus(v) ?: v

    fun minimumRounds(tasks: IntArray): Int {
        var result = 0
        val taskCount: HashMap<Int, Int> = hashMapOf()
        tasks.forEach { t -> taskCount[t] = taskCount[t]?.plus(1) ?: 1 }
        for (t in taskCount) {
            if (t.value == 1) return -1
            result += t.value / 3 + (if (t.value % 3 == 0) 0 else 1)
        }
        return result
    }
}
