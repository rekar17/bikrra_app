import 'dart:typed_data';

import 'package:bikrra_app/services/wedding_card.service.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

Future<Uint8List> generateWeddingCardPDF(
  String brideName,
  String groomName,
  String date,
  String venue,
  Uint8List? imageData,
  String qrData,
) async {
  final pdf = pw.Document();
  const pageFormat = PdfPageFormat.a5;

  final ttf = Font.ttf(await rootBundle.load('assets/fonts/peshang.ttf'));

  pdf.addPage(pw.Page(
    pageFormat: pageFormat,
    theme: pw.ThemeData.withFont(base: ttf),
    textDirection: TextDirection.rtl,
    build: (pw.Context context) {
      return pw.Center(
        child: WeddingCard(
          brideName: brideName,
          groomName: groomName,
          date: date,
          venue: venue,
          imageData: imageData,
          ttf: ttf,
          qrCode: qrData,
        ),
      );
    },
  ));
  return await pdf.save();
}
