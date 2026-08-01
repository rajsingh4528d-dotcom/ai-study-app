class ProgressService {
  static int completedChapters = 0;

  static void completeChapter() {
    completedChapters++;
  }

  static int getProgress() {
    return completedChapters;
  }
}