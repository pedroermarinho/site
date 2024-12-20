import '../../../../domain/use_cases/build_pdf.dart';
import '../../../../utils/download_pdf.dart';

class PersonalInformationViewModel {
  final BuildPdf buildPdf;

  PersonalInformationViewModel({required this.buildPdf});

  void downloadPdfFile() async {
    final pdf = await buildPdf();
    final pdfBytes = await pdf.save();
    await downloadPdf(pdfBytes, "curriculo_pedro_marinho.pdf");
  }
}
