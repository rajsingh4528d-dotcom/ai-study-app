class QuizResult {
  final int totalQuestions;
  final int correctAnswers;

  QuizResult({
    required this.totalQuestions,
    required this.correctAnswers,
  });

  double get percentage =>
      (correctAnswers / totalQuestions) * 100;
}