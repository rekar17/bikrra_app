import 'package:bikrra_app/classes/services.class.dart';
import 'package:bikrra_app/constants/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:bikrra_app/ui/widgets/service.widget.dart';

class UserBeautyCenterListScreen extends StatefulWidget {
  const UserBeautyCenterListScreen({super.key});

  @override
  State<UserBeautyCenterListScreen> createState() =>
      _UserBeautyCenterListScreenState();
}

class _UserBeautyCenterListScreenState
    extends State<UserBeautyCenterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خزمەتگوزاریەکان',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: beautyCenterServices.isNotEmpty
          ? ListView.builder(
              itemCount: beautyCenterServices.length,
              itemBuilder: (context, index) {
                return ServiceWidget(service: beautyCenterServices[index]);
              },
            )
          : const Center(
              child: Text(
                'هیچ خزمەتگوزاریێکی نەدۆزراوە',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
    );
  }
}
