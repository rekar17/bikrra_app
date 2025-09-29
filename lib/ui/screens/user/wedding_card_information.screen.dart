// ignore_for_file: unused_local_variable

import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/services/pdf_generator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:pdf/widgets.dart' as pw;

class WeddingCardInformationScreen extends StatefulWidget {
  final String giftList;
  const WeddingCardInformationScreen({super.key, required this.giftList});

  @override
  WeddingCardInformationScreenState createState() =>
      WeddingCardInformationScreenState();
}

class WeddingCardInformationScreenState
    extends State<WeddingCardInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _brideNameController = TextEditingController();
  final TextEditingController _groomNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    await _requestPermission();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _requestPermission() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  //show pdf
  Future<void> _showPDF() async {
    final directory = await getApplicationDocumentsDirectory();
    final pdfFile = File('${directory.path}/wedding_card.pdf');
    if (!pdfFile.existsSync()) {
      await _savePDF();
    }
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Material(
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                  Text(
                    'کارتی مەراسیم - بطاقة الزواج',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: PDFView(
                      onError: (error) {
                        print(error);
                      },
                      filePath: pdfFile.path,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _savePDF() async {
    if (_formKey.currentState!.validate()) {
      final qrCodeData = 'bikrra://giftlist/?giftList=${widget.giftList}';
      final qrCodeImage = QrPainter(
        data: qrCodeData,
        version: QrVersions.auto,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
        ),
      );

      final pdfData = await generateWeddingCardPDF(
        _brideNameController.text,
        _groomNameController.text,
        _dateController.text,
        _venueController.text,
        _imageFile != null ? await _imageFile!.readAsBytes() : null,
        qrCodeData,
      );

      final directory = await getApplicationDocumentsDirectory();
      final pdfFile = File('${directory.path}/wedding_card.pdf');
      await pdfFile.writeAsBytes(pdfData);

      await _showPDF();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('کارتی مەراسیم بەسەرکرایەوە'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('زانیاری کارتی مەراسیم'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _brideNameController,
                  decoration: const InputDecoration(
                    labelText: 'ناوی بووک',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'تکایە ناوی بووک بنووسە';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _groomNameController,
                  decoration: const InputDecoration(
                    labelText: 'ناوی زاوا',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'تکایە ناوی زاوا بنووسە';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2035),
                    );
                    if (date != null) {
                      _dateController.text =
                          date.toIso8601String().split('T')[0];
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'بەرواری مەراسیم (بۆ نموونە: ١٢/١٢/٢٠٢١)',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'تکایە بەرواری مەراسیم بنووسە';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _venueController,
                  decoration: const InputDecoration(
                    labelText: 'ناونیشانی مەراسیم',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'تکایە ناونیشانی مەراسیم بنووسە';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainPinkColor,
                  ),
                  child: const Text(
                    'وێنە هەڵبژێرە (ئەگەر دەتەوێت)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                if (_imageFile != null) Image.file(_imageFile!),
                ElevatedButton(
                  onPressed: () async {
                    await _savePDF();
                    //await _generateAndPrintPDF();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.meduimPinkColor,
                  ),
                  child: const Text(
                    'دروستکردن و چاپکردنی کارتی مەراسیم',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
