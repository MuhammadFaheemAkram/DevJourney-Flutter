/// A note's Markdown as one line of plain text, for list previews: headings,
/// emphasis, code marks, list markers and quotes go; a link keeps its text;
/// fenced code blocks are left out (a preview reads as prose).
String plainTextPreview(String markdown) {
  final lines = <String>[];
  var inFence = false;
  for (var line in markdown.split('\n')) {
    line = line.trim();
    if (line.startsWith('```')) {
      inFence = !inFence;
      continue;
    }
    if (inFence || line.isEmpty) continue;
    line = line
        .replaceFirst(RegExp(r'^#{1,6}\s+'), '')
        .replaceFirst(RegExp(r'^>\s?'), '')
        .replaceFirst(RegExp(r'^([-*+]|\d+\.)\s+'), '')
        .replaceAllMapped(RegExp(r'\[([^\]]*)\]\([^)]*\)'), (m) => m[1]!)
        .replaceAll(RegExp(r'[*_`~]'), '');
    if (line.isNotEmpty) lines.add(line);
  }
  return lines.join(' ');
}
