import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/widgets/comfirm_dialog.widget.dart';
import 'package:bikrra_app/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserOrderCheckoutScreen extends StatefulWidget {
  const UserOrderCheckoutScreen({super.key});

  @override
  State<UserOrderCheckoutScreen> createState() =>
      _UserOrderCheckoutScreenState();
}

class _UserOrderCheckoutScreenState extends State<UserOrderCheckoutScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'تأكيد الطلب',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.kButtonsAndSecondaryBrownColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CircleAvatar(
            backgroundColor: AppColors.mainPinkColor,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'الاسم',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              validator: (value) {
                return Validators.text(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'رقم الهاتف',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              validator: (value) {
                return Validators.phone(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'العنوان',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              validator: (value) {
                return Validators.text(value);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: notesController,
              maxLength: 200,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'ملاحظات',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
              validator: (value) {
                return Validators.note(value, isRequired: false);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                await comfirmDialogWidget(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainPinkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'ارسال الطلب',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
