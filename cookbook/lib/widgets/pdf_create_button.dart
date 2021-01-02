import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../screens/pdf_preview_screen.dart';

class PdfButton extends StatelessWidget {
  final pdf = pw.Document();
  writeOnPdf() {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, 200 * PdfPageFormat.mm,
            marginTop: PdfPageFormat.mm * 10,
            marginLeft: PdfPageFormat.mm * 0,
            marginRight: PdfPageFormat.mm * 0),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Table(
              children: <pw.TableRow>[
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(
                    'Pöntunarnr.:',
                    style: pw.TextStyle(
                        font: pw.Font.helveticaBold(), fontSize: 16),
                  ),
                  pw.Text('00001')
                ]),
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(
                    'Nafn:',
                    style: pw.TextStyle(
                        font: pw.Font.helveticaBold(), fontSize: 16),
                  ),
                  pw.Text('Andri Geir')
                ]),
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(
                    'Afengingarmáti:',
                    style: pw.TextStyle(
                        font: pw.Font.helveticaBold(), fontSize: 16),
                  ),
                  pw.Text('SÓTT')
                ]),
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(
                    'Afhendinarstaður:',
                    style: pw.TextStyle(
                        font: pw.Font.helveticaBold(), fontSize: 16),
                  ),
                  pw.Text('Skipholt')
                ]),
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(
                    'Greiðsluform:',
                    style: pw.TextStyle(
                        font: pw.Font.helveticaBold(), fontSize: 16),
                  ),
                  pw.Text('GREITT')
                ]),
              ],
              tableWidth: pw.TableWidth.max,
              border: pw.TableBorder.ex(
                bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.solid),
              ),
            ),
            pw.Table(
              columnWidths: {
                0: pw.FractionColumnWidth(0.1),
                1: pw.FractionColumnWidth(0.5),
                2: pw.FractionColumnWidth(0.15),
                3: pw.FractionColumnWidth(0.15),
              },
              children: <pw.TableRow>[
                pw.TableRow(
                  children: <pw.Widget>[
                    pw.Text(
                      'Magn',
                      style: pw.TextStyle(
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Text(
                      'Nafn',
                      style: pw.TextStyle(
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Text(
                      'Stærð',
                      style: pw.TextStyle(
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Text(
                      'Verð',
                      style: pw.TextStyle(
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                  ],
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom:
                          pw.BorderSide(width: 1, style: pw.BorderStyle.dashed),
                    ),
                  ),
                ),
                pw.TableRow(
                  children: <pw.Widget>[
                    pw.Text(
                      '1',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.Text(
                      'Bragðarefur',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.Text(
                      'Barna',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.Text(
                      '1000',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                  ],
                ),
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(''),
                  pw.Text('Mars, Jarðaber, Oreo')
                ]),
                pw.TableRow(
                  children: <pw.Widget>[
                    pw.Text(
                      '2',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.Text(
                      'Ís í Boxi',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.Text(
                      'Stór',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.Text(
                      '750',
                      style: pw.TextStyle(
                        font: pw.Font.helvetica(),
                      ),
                    ),
                  ],
                ),
                pw.TableRow(children: <pw.Widget>[
                  pw.Text(''),
                  pw.Text('Heit Súkkulaði sósa, Snickerskurl')
                ]),
              ],
              border: pw.TableBorder.ex(
                bottom: pw.BorderSide(width: 1, style: pw.BorderStyle.dashed),
              ),
            )
          ];
        },
      ),
    );
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File('$documentPath/example.pdf');

    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        writeOnPdf();
        await savePdf();
        Directory documentDirectory = await getApplicationDocumentsDirectory();

        String documentPath = documentDirectory.path;

        String fullPath = '$documentPath/example.pdf';
        print(fullPath);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PdfPreviewScreen(fullPath)));
      },
      icon: Icon(Icons.save),
    );
  }
}
