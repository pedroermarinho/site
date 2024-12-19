import 'dart:html' as html;
import 'dart:typed_data';

Future<void> downloadPdf(Uint8List pdfBytes, String fileName) async {
  final blob = html.Blob([pdfBytes]);

  final url = html.Url.createObjectUrlFromBlob(blob);

  final anchor = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = fileName;

  anchor.click();

  html.Url.revokeObjectUrl(url);
}
