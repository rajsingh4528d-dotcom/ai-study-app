class BookmarkService {
  static final List<String> bookmarks = [];

  static void addBookmark(String title) {
    if (!bookmarks.contains(title)) {
      bookmarks.add(title);
    }
  }

  static void removeBookmark(String title) {
    bookmarks.remove(title);
  }

  static List<String> getBookmarks() {
    return bookmarks;
  }
}