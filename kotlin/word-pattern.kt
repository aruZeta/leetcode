// Topics: Hash Table, String

class Solution {
    fun wordPattern(pattern: String, s: String): Boolean {
        val words: List<String> = s.split(" ")
        if (pattern.length != words.size) return false
        val map: HashMap<Char, String> = hashMapOf()
        pattern.forEachIndexed { i, c ->
            map[c]?.let { if (it != words[i]) return false }
                ?: if (map.containsValue(words[i])) return false else map[c] = words[i]
        }
        return true
    }
}
