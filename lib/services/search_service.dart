class SearchService {
  static List<String> search(
      List<String> data,
      String keyword,
      ) {
    return data
        .where(
          (e) => e.toLowerCase().contains(
                keyword.toLowerCase(),
              ),
        )
        .toList();
  }
}