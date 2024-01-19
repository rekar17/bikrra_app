// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, use_build_context_synchronously, unnecessary_null_comparison, avoid_print

import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/widgets/cake_text_input.widget.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 100,
            ),
            Flexible(
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('assets/asumaLogo.jpg'),
                    )),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CakeTextField(controller: _ctrlUsername, hintText: 'Username'),
            SizedBox(
              height: 10,
            ),
            CakeTextField(controller: _ctrlPassword, hintText: 'Password'),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                splashColor: Colors.brown.shade300,
                height: 50,
                onPressed: () async {
                  try {
                    setState(() {
                      showLoading = true;
                      FocusScope.of(context).unfocus();
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                color: AppColors.kButtonsAndSecondaryBrownColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
          ]),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/cakeBackground.jpg'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
