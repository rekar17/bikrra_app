import 'package:bikrra_app/classes/services.class.dart';
import 'package:bikrra_app/constants/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:bikrra_app/ui/widgets/service.widget.dart';

class UserPartyHallListScreen extends StatefulWidget {
  const UserPartyHallListScreen({super.key});

  @override
  State<UserPartyHallListScreen> createState() =>
      _UserPartyHallListScreenState();
}

class _UserPartyHallListScreenState extends State<UserPartyHallListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'خزمەتگوزاریەکان',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: partyHallServices.isNotEmpty
          ? ListView.builder(
              itemCount: partyHallServices.length,
              itemBuilder: (context, index) {
                return ServiceWidget(service: partyHallServices[index]);
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
