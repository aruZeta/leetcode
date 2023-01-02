// Topics: String

bool isLower(char c) {
    return c >= 97 && c <= 122;
}

bool detectCapitalUse(char* word) {
    if (word[1] == '\0') return true;
    bool allCapital = true;
    bool capitalFound = false;
    for (int i = 1; word[i] != '\0'; i++)
      if (isLower(word[i])) allCapital = false;
      else capitalFound = true;
    return (isLower(word[0])) ? !capitalFound : allCapital || !capitalFound;
}
