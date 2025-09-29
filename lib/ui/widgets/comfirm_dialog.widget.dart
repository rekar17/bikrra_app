import 'package:flutter/material.dart';

Future<bool?> comfirmDialogWidget(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('تأكيد الطلب'),
      content: const Text('هل انت متأكد من ارسال الطلب؟'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('الغاء'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('تم ارسال الطلب'),
                content: const Text(
                    'تم ارسال الطلب بنجاح، سيتم التواصل معكم قريباً'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('حسناً'),
                  ),
                ],
              ),
            );
          },
          child: const Text('ارسال'),
        ),
      ],
    ),
  );
}
