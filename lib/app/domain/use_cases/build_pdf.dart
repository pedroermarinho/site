import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../entities/settings/academic.dart';
import '../entities/settings/settings.dart';
import '../entities/settings/skills.dart';
import '../entities/settings/work_experience.dart';
import '../view_models/data_viewmodel.dart';

class BuildPdf {
  final DataViewModel dataViewModel;

  BuildPdf({required this.dataViewModel});

  Future<pw.Document> call() async {
    final data = dataViewModel.settings;
    final pdf = pw.Document();

    final image = pw.MemoryImage(await loadNetworkImage(data.photo));

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(0),
          theme: pw.ThemeData.withFont(
            base: await PdfGoogleFonts.openSansRegular(),
            bold: await PdfGoogleFonts.openSansBold(),
            icons: await PdfGoogleFonts.materialIcons(), // this line
          ),
          build: (context) => pw.Column(children: [
                _header(
                  data: data,
                  image: image,
                ),
                pw.Expanded(
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 190,
                        padding: const pw.EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 3,
                        ),
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromInt(0xffede6e0),
                        ),
                        child: pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              _sectionTitle(
                                "Informações Pessoais",
                              ),
                              pw.SizedBox(height: 8),
                              pw.Row(
                                children: [
                                  pw.Icon(pw.IconData(0xe0be), size: 12),
                                  pw.SizedBox(width: 5),
                                  pw.Text(
                                    data.email,
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xff58585c),
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 5),
                              pw.Row(
                                children: [
                                  pw.Icon(pw.IconData(0xe0cd), size: 12),
                                  pw.SizedBox(width: 5),
                                  pw.Text(
                                    "+${data.phone.countryCode} (${data.phone.areaCode}) ${data.phone.number}",
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xff58585c),
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 5),
                              pw.Row(
                                children: [
                                  pw.Icon(pw.IconData(0xe0c8), size: 12),
                                  pw.SizedBox(width: 5),
                                  pw.Text(
                                    data.location,
                                    style: pw.TextStyle(
                                      color: PdfColors.grey800,
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 5),

                              pw.Row(
                                children: [
                                  pw.Icon(pw.IconData(0xe916), size: 12),
                                  pw.SizedBox(width: 5),
                                  pw.Text(
                                    data.birthDate,
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xff58585c),
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 10),
                              _sectionTitle("Educação"),
                              _listItem(data.academic),

                              _sectionTitle("Habilidades"),
                              _buildOrganizedSkills(data.skills),
                              pw.SizedBox(height: 10),
                              // Links
                              _sectionTitle("Links"),
                              if (data.socialLinks.linkedin != null) _link("LinkedIn", "https://www.linkedin.com/in/${data.socialLinks.linkedin}/"),
                              _link("GitHub", "https://github.com/${data.socialLinks.github}"),
                              _link("Portfólio", "https://pedroermarinho.github.io/"),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Padding(
                          padding: const pw.EdgeInsets.only(left: 10, right: 10),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              _sectionTitle("Resumo"),
                              pw.Divider(),
                              pw.Text(
                                data.summary,
                                style: pw.TextStyle(
                                  fontSize: 11,
                                  color: PdfColors.grey900,
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              _sectionTitle("Experiência Profissional"),
                              pw.Divider(),
                              _workExperienceItem(data.workExperience),
                              pw.SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],),),
    );

    return pdf;
  }

  pw.Widget _header({required Settings data, required pw.MemoryImage image}) => pw.Container(
        height: 120,
        decoration: pw.BoxDecoration(
          color: PdfColor.fromInt(0xff36373e),
        ),
        child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Container(
                width: 200,
                child: pw.Center(
                  child: pw.Container(
                    width: 80,
                    height: 80,
                    decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      image: pw.DecorationImage(image: image, fit: pw.BoxFit.cover),
                    ),
                  ),
                )),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  data.fullName,
                  style: pw.TextStyle(
                    fontSize: 24,
                    color: PdfColors.white,
                  ),
                ),
                pw.SizedBox(height: 5),
                pw.Text(
                  data.role,
                  style: pw.TextStyle(
                    fontSize: 12,
                    color: PdfColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  pw.Widget _sectionTitle(String title) => pw.Padding(
        padding: const pw.EdgeInsets.only(
          top: 8,
          bottom: 2,
        ),
        child: pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 13,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.grey900,
          ),
        ),
      );

  pw.Widget _listItem(List<Academic> academics) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            ...academics.map(
              (academic) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text(
                  academic.course,
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 11,
                    color: PdfColors.grey800,
                  ),
                ),
                pw.SizedBox(height: 1),
                pw.Text(
                  academic.institution,
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey800,
                  ),
                ),
                pw.SizedBox(height: 1),
                pw.Text(
                  academic.type,
                  style: const pw.TextStyle(
                    fontSize: 9,
                    color: PdfColors.grey800,
                  ),
                ),
                pw.SizedBox(height: 1),
                pw.Text(
                  "${academic.startDate} - ${academic.endDate}",
                  style: const pw.TextStyle(
                    fontSize: 9,
                    color: PdfColors.grey800,
                  ),
                ),
                pw.SizedBox(height: 5),
              ],),
            ),
          ],
        ),
      );

  pw.Widget _workExperienceItem(List<WorkExperience> workExperiences) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: workExperiences
            .map(
              (workExperience) => pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    workExperience.companyName,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 11,
                      color: PdfColors.grey800,
                    ),
                  ),
                  pw.SizedBox(height: 1),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(left: 10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        ...workExperience.roles
                            .map(
                              (role) => pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    role.role,
                                    style: pw.TextStyle(
                                      fontSize: 9,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.grey800,
                                    ),
                                  ),
                                  pw.SizedBox(width: 2),
                                  pw.Text(
                                    "${role.startDate} - ${role.endDate ?? 'Atual'}",
                                    style: const pw.TextStyle(
                                      fontSize: 9,
                                      color: PdfColors.grey800,
                                    ),
                                  ),
                                  pw.SizedBox(height: 2),
                                ],
                              ),
                            )
                            .toList(),
                        pw.SizedBox(height: 1),
                        if (workExperience.details.isNotEmpty)
                          pw.Text(
                            "Detalhes:",
                            style: pw.TextStyle(
                              fontSize: 9,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.grey800,
                            ),
                          ),
                        ...workExperience.details
                            .map(
                              (detail) => pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "- $detail",
                                    style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
                                  ),
                                  pw.SizedBox(height: 1),
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 5),
                ],
              ),
            )
            .toList(),
      );

  pw.Widget _skillChip({required String skill, required bool isPrimary}) => pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: pw.BoxDecoration(
          color: isPrimary ? PdfColors.lightGreen : PdfColors.greenAccent,
          borderRadius: pw.BorderRadius.circular(4),
        ),
        child: pw.Text(
          skill,
          style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey900),
        ),
      );

  pw.Widget _link(String name, String url) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 2),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "$name: ",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 9,
                color: PdfColors.grey800,
              ),
            ),
            pw.UrlLink(
              destination: url,
              child: pw.Text(
                url,
                style: const pw.TextStyle(
                  color: PdfColors.blue,
                  decoration: pw.TextDecoration.underline,
                  fontSize: 8,
                ),
              ),
            ),
          ],
        ),
      );

  pw.Widget _buildOrganizedSkills(Skills skills) {
    final primarySkills = <String>[
      ...skills.primary.languages,
      ...skills.primary.frameworks,
      ...skills.primary.tools,
      ...skills.primary.platforms,
      ...skills.primary.os,
    ];

    final secondarySkills = <String>[
      ...skills.secondary.languages,
      ...skills.secondary.frameworks,
      ...skills.secondary.tools,
      ...skills.secondary.platforms,
      ...skills.secondary.os,
    ];

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Habilidades Primárias",
          style: pw.TextStyle(
            fontSize: 10,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.grey700,
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Wrap(
          spacing: 3,
          runSpacing: 3,
          children: primarySkills
              .map(
                (skill) => _skillChip(
                  skill: skill,
                  isPrimary: true,
                ),
              )
              .toList(),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          "Habilidades Secundárias",
          style: pw.TextStyle(
            fontSize: 10,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.grey700,
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Wrap(
          spacing: 3,
          runSpacing: 3,
          children: secondarySkills
              .map(
                (skill) => _skillChip(
                  skill: skill,
                  isPrimary: false,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Future<Uint8List> loadNetworkImage(String url) async {
    final response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      Logger().e('Falha ao carregar imagem da URL: $url');
      throw Exception('Falha ao carregar imagem da URL: $url');
    }
  }
}
