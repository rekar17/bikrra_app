// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/ui/screens/register.screen.dart';
import 'package:bikrra_app/ui/widgets/cake_text_input.widget.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showLoading = false;
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/cakeBackground.jpg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/asumaLogo.jpg'),
                      )),
                ),
                SizedBox(
                  height: 60,
                ),
                //opcity container to show login text
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.cakePinkColor),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kButtonsAndSecondaryBrownColor,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                CakeTextField(controller: _ctrlUsername, hintText: 'Username'),
                SizedBox(
                  height: 10,
                ),
                CakeTextField(controller: _ctrlPassword, hintText: 'Password'),
                SizedBox(
                  height: 60,
                ),
                MaterialButton(
                  splashColor: AppColors.cakePinkColor,
                  height: 50,
                  minWidth: 110,
                  onPressed: () async {
                    try {
                      setState(() {
                        showLoading = true;
                      });

                      setState(() {
                        showLoading = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: AppColors.cakePinkColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kButtonsAndSecondaryBrownColor,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 110,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  color: AppColors.cakePinkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: AppColors.darkGreenColor, width: 2),
                  ),
                  child: Text(
                    ' Create new account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kButtonsAndSecondaryBrownColor,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  splashColor: Colors.brown.shade300,
                  height: 50,
                  minWidth: 110,
                  onPressed: () async {
                    try {
                      setState(() {
                        showLoading = true;
                      });
                      showLoading == true;

                      setState(() {
                        showLoading = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: AppColors.cakePinkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: AppColors.darkGreenColor, width: 2),
                  ),
                  child: Text(
                    'Continue Anonymous',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kButtonsAndSecondaryBrownColor,
                        fontSize: 20),
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
