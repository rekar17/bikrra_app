import 'package:flutter/material.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/utils/methods.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final key = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormFieldState<String>>();
  final passwordKey = GlobalKey<FormFieldState<String>>();
  final emailKey = GlobalKey<FormFieldState<String>>();
  final phoneKey = GlobalKey<FormFieldState<String>>();
  final addressKey = GlobalKey<FormFieldState<String>>();
  final cityKey = GlobalKey<FormFieldState<String>>();
  final stateKey = GlobalKey<FormFieldState<String>>();
  final zipKey = GlobalKey<FormFieldState<String>>();
  final birthDateKey = GlobalKey<FormFieldState<String>>();
  bool isLoading = false;

  DateTime? birthDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('انشاء حساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                    aspectRatio: 1 / 0.5,
                    child: Image.asset('assets/bikrra_logo.jpeg')),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: usernameKey,
                  decoration: InputDecoration(
                    hintText: 'اسم المستخدم',
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الاسم مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //complete other fields with the same style
                TextFormField(
                  key: emailKey,
                  decoration: InputDecoration(
                    hintText: 'البريد الالكتروني',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'البريد الالكتروني مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: phoneKey,
                  decoration: InputDecoration(
                    hintText: 'رقم الهاتف',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'رقم الهاتف مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: passwordKey,
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'كلمة المرور مطلوبة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  key: addressKey,
                  decoration: InputDecoration(
                    hintText: 'العنوان',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'العنوان مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // City field
                TextFormField(
                  key: cityKey,
                  decoration: InputDecoration(
                    hintText: 'المدينة',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'المدينة مطلوبة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

// State field
                TextFormField(
                  key: stateKey,
                  decoration: InputDecoration(
                    hintText: 'المحافظة',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'المحافظة مطلوبة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

// Zip Code field
                TextFormField(
                  key: zipKey,
                  decoration: InputDecoration(
                    hintText: 'الرمز البريدي',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرمز البريدي مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

// Birth Date field
                TextFormField(
                  key: birthDateKey,
                  readOnly: true,
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        birthDate = selectedDate;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: birthDate != null
                        ? birthDate!.toString().split(' ')[0]
                        : 'تاريخ الميلاد',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.mainPinkColor),
                    ),
                    errorStyle: const TextStyle(color: AppColors.mainPinkColor),
                    hintStyle: const TextStyle(
                        color: AppColors.mainPinkColor, fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'تاريخ الميلاد مطلوب';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainPinkColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    //change the size of the button
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      // TODO: Implement registration logic
                    }
                  },
                  child: const Text(
                    'انشاء حساب',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
