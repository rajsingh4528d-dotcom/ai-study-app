class QuizService {
  int score = 0;

  void checkAnswer(int selected, int correct) {
    if (selected == correct) {
      score++;
    }
  }

  void reset() {
    score = 0;
  }
}