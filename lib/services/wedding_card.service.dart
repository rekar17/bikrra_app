import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class WeddingCard extends StatelessWidget {
  final String brideName;
  final String groomName;
  final String date;
  final String venue;
  final Uint8List? imageData; // Optional image data
  final ttf;
  final String qrCode;

  WeddingCard({
    required this.brideName,
    required this.groomName,
    required this.date,
    required this.venue,
    this.imageData,
    required this.ttf,
    required this.qrCode,
  });

  @override
  Widget build(pw.Context context) {
    return pw.Container(
      width: double.infinity, // Make the container full width
      margin: const pw.EdgeInsets.all(10),
      padding: const pw.EdgeInsets.all(10),
      decoration: const pw.BoxDecoration(
        gradient: pw.LinearGradient(
          colors: [PdfColors.pink100, PdfColors.pink400],
          begin: pw.Alignment.topLeft,
          end: pw.Alignment.bottomRight,
        ),
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(15)),
        boxShadow: [
          pw.BoxShadow(
            color: PdfColors.grey300,
            blurRadius: 5,
            offset: PdfPoint(2, 2),
          ),
        ],
      ),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            'Wedding Invitation',
            style: pw.TextStyle(
              font: ttf,
              fontSize: 20,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Container(
              decoration: pw.BoxDecoration(
                shape: pw.BoxShape.circle,
                border: pw.Border.all(color: PdfColors.white, width: 5),
              ),
              child: pw.ClipOval(
                child: (imageData != null)
                    ? pw.Image(pw.MemoryImage(imageData!),
                        width: 70, height: 70, fit: pw.BoxFit.cover)
                    : pw.Container(
                        width: 70,
                        height: 70,
                        color: PdfColors.grey200,
                      ),
              ),
            ),
          ),
          pw.SizedBox(height: 30),
          pw.Text(
            '$brideName  &  $groomName',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              font: ttf,
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Divider(color: PdfColors.white, thickness: 1.5),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                'Date: ',
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 16,
                  color: PdfColors.white,
                ),
              ),
              pw.Text(
                date,
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 16,
                  color: PdfColors.white,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 5),
          pw.Divider(color: PdfColors.white, thickness: 1.5),
          pw.SizedBox(height: 5),
          pw.Text(
            'Venue: ',
            style: pw.TextStyle(
              font: ttf,
              fontSize: 16,
              color: PdfColors.white,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            venue,
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              font: ttf,
              fontSize: 16,
              color: PdfColors.white,
            ),
          ),
          // Add a QR code using memory image
          pw.SizedBox(height: 10),

          pw.BarcodeWidget(
            height: 80,
            width: 80,
            data: qrCode,
            color: PdfColors.white,
            barcode: pw.Barcode.qrCode(),
          ),
          pw.Spacer(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                'Bikrra Wedding Card',
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 16,
                  color: PdfColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
