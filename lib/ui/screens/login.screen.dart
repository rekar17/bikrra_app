import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/screens/register.screen.dart';
import 'package:bikrra_app/utils/methods.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormFieldState<String>>();
  final passwordKey = GlobalKey<FormFieldState<String>>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 1 / 0.5,
                    child: Image.asset('assets/bikrra_logo.jpeg')),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  key: usernameKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال اسم المستخدم';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'اسم المستخدم',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      color: AppColors.mainPinkColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.user,
                      color: AppColors.mainPinkColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  key: passwordKey,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      if (value.length < 6) {
                        return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                      }
                    }
                    if (value.isEmpty) {
                      return 'الرجاء إدخال كلمة المرور';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      color: AppColors.mainPinkColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.lock,
                      color: AppColors.mainPinkColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainPinkColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: isLoading == true
                      ? () {}
                      : () async {
                          try {
                            if (!key.currentState!.validate()) return;

                            setState(() {
                              isLoading = true;
                            });
                            // var loggedIn = await context
                            //     .read<LoginProvider>()
                            //     .localAuthentication(
                            //       usernameKey.currentState!.value!,
                            //       passwordKey.currentState!.value!,
                            //     );
                            // if (!context.mounted) return;
                            // loggedIn ??=
                            //     await context.read<LoginProvider>().login(
                            //           usernameKey.currentState!.value!,
                            //           passwordKey.currentState!.value!,
                            //           fcmToken!,
                            //         );
                            // if (!context.mounted) return;

                            // if (loggedIn == null) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content:
                            //           Text('اسم المستخدم أو كلمة المرور خاطئة'),
                            //       backgroundColor: Colors.red,
                            //     ),
                            //   );
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            //   return;
                            // } else {
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            //   if (!context.mounted) return;
                            //   pushScreen(context,
                            //       AdminHomeScreen(userId: loggedIn.id));
                            // }

                            setState(() {
                              isLoading = false;
                            });
                          } catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.meduimPinkColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    pushScreen(context, const RegisterScreen());
                  },
                  child: const Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
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

// Future<void> subscribeToTopic(String topic) async {
//   await FirebaseMessaging.instance.subscribeToTopic(topic);
// }