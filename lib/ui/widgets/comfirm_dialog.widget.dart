import 'package:flutter/material.dart';

Future comfirmDialogWidget(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('تأكيد الطلب'),
      content: const Text('هل انت متأكد من ارسال الطلب؟'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('الغاء'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('تم ارسال الطلب'),
                content: const Text(
                    'تم ارسال الطلب بنجاح، سيتم التواصل معكم قريباً'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
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
