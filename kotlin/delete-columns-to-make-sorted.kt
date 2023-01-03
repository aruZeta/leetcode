// Topics: Array, String

class Solution {
    fun minDeletionSize(strs: Array<String>): Int {
        var result = 0
        for (i in strs[0].indices) {
            for (j in 1 until strs.size) {
                if (strs[j][i] < strs[j-1][i]) {
                    result++
                    break
                }
            }
        }
        return result
    }
}
