import 'package:flutter/material.dart';
import 'package:bikrra_app/classes/services.class.dart';

class ServiceWidget extends StatelessWidget {
  final ServiceC service;
  const ServiceWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(service.name),
        subtitle: Text(service.description),
        trailing: Image.asset(service.category.imageUrl),
      ),
    );
  }
}
