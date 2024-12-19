import 'dart:typed_data';
import 'dart:io';

Future<void> downloadPdf(Uint8List pdfBytes, String fileName) async {
  final file = File(fileName);
  await file.writeAsBytes(pdfBytes);
  print('PDF salvo em: ${file.path}');
}
