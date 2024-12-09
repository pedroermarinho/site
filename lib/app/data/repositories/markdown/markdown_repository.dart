abstract class MarkdownRepository {
  Future<String> getMarkdown(String path);

  Future<List<String>> getMarkdownList();
}
