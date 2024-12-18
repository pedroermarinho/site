import 'package:pedroermarinho/app/config/assets_path.dart';
import 'package:pedroermarinho/app/data/repositories/markdown/markdown_repository_local.dart';
import 'package:pedroermarinho/app/domain/use_cases/get_markdown.dart';
import 'package:test/test.dart';

void main() {

  test('Buscar markdown local - About', () async {
    GetMarkdown getMarkdown = GetMarkdownImpl(
      repository: MarkdownRepositoryLocal(),
    );

    final result = await getMarkdown(AssetsPath.aboutMD);

    expect(result.isSuccess(), true);
  });

  test('Deve retornar erro ao buscar markdown local, arquivo não encontrado', () async {
    GetMarkdown getMarkdown = GetMarkdownImpl(
      repository: MarkdownRepositoryLocal(),
    );

    final result = await getMarkdown('assets/md/about2.md');

    expect(result.isError(), true);
  });
}