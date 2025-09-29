import 'package:bikrra_app/classes/services.class.dart';
import 'package:bikrra_app/constants/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:bikrra_app/ui/widgets/service.widget.dart';

class UserFasionDesignerListScreen extends StatefulWidget {
  const UserFasionDesignerListScreen({super.key});

  @override
  State<UserFasionDesignerListScreen> createState() =>
      _UserFasionDesignerListScreenState();
}

class _UserFasionDesignerListScreenState
    extends State<UserFasionDesignerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خزمەتگوزاریەکان',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: fashionServices.isNotEmpty
          ? ListView.builder(
              itemCount: fashionServices.length,
              itemBuilder: (context, index) {
                return ServiceWidget(service: fashionServices[index]);
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
