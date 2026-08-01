class ChapterContent {
  final int id;
  final String title;
  final String description;
  final String notes;
  final List<String> examples;
  final List<String> practice;
  final String summary;
  final List<String> funFacts;

  const ChapterContent({
    required this.id,
    required this.title,
    required this.description,
    required this.notes,
    required this.examples,
    required this.practice,
    required this.summary,
    required this.funFacts,
  });
}