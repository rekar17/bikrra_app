import 'package:bikrra_app/classes/services.class.dart';
import 'package:bikrra_app/constants/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:bikrra_app/ui/widgets/service.widget.dart';

class UserPhotographerListScreen extends StatefulWidget {
  const UserPhotographerListScreen({super.key});

  @override
  State<UserPhotographerListScreen> createState() =>
      _UserPhotographerListScreenState();
}

class _UserPhotographerListScreenState
    extends State<UserPhotographerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خزمەتگوزاریەکان',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: photographerServices.isNotEmpty
          ? ListView.builder(
              itemCount: photographerServices.length,
              itemBuilder: (context, index) {
                return ServiceWidget(service: photographerServices[index]);
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
