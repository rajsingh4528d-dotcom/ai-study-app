class CategoryData {
  final String title;
  final String subtitle;
  final String emoji;

  CategoryData({
    required this.title,
    required this.subtitle,
    required this.emoji,
  });
}

final List<CategoryData> categories = [
  CategoryData(
    title: "School",
    subtitle: "Class 6 - Class 12",
    emoji: "🏫",
  ),
  CategoryData(
    title: "College",
    subtitle: "BCA, B.Tech, MCA, MBA...",
    emoji: "🎓",
  ),
  CategoryData(
    title: "Programming",
    subtitle: "C, C++, Java, Python, Flutter...",
    emoji: "💻",
  ),
  CategoryData(
    title: "Competitive Exams",
    subtitle: "UPSC, SSC, Railway, Banking...",
    emoji: "🏆",
  ),
  CategoryData(
    title: "Languages",
    subtitle: "English, Hindi, Japanese...",
    emoji: "🌍",
  ),
];