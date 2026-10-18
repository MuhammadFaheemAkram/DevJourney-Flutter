/// Turns what the user typed into a safe FTS5 query, or `null` when there's
/// nothing to search for.
///
/// FTS5 has its own query language: `AND`, `OR`, `NOT`, `NEAR`, `*`, `^`,
/// `-`, `:`, parentheses and quotes all mean something, and a stray one is a
/// syntax error (or a different search). So each word is put in double
/// quotes, which makes it a plain string, with any quote inside removed.
/// The last word gets a `*` outside its quotes, a prefix match, so results
/// appear while the user is still typing ("strea" finds "streams"). Words
/// with no letter or digit are dropped: FTS5 would find nothing for them.
///
/// `stream AND "rx` → `"stream" "AND" "rx"*`: three words, all required.
String? ftsQuery(String text) {
  final words = [
    for (final word in text.split(RegExp(r'\s+')))
      if (_hasLetterOrDigit.hasMatch(word)) word.replaceAll('"', ''),
  ];
  if (words.isEmpty) return null;
  return [
    for (final (index, word) in words.indexed)
      index == words.length - 1 ? '"$word"*' : '"$word"',
  ].join(' ');
}

final _hasLetterOrDigit = RegExp(r'[\p{L}\p{N}]', unicode: true);
