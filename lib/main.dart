// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, equal_keys_in_map, unused_import, depend_on_referenced_packages

import 'package:bikrra_app/constants/shared_values.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/ui/screens/user/user_home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedValues.init();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductCartProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Peshang',
          ),
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('ar')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: MyApp(),
        )),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future waiting() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return UserHomeScreen();
    // return FutureBuilder(
    //   future: waiting(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return SplashScreen();
    //     }
    //     return UserHomeScreen();
    //   },
    // );
  }
}
// AnimatedSplashScreen(
//       splash: Splash(),
//       nextScreen: Login(),
//       backgroundColor: kButtonsAndSecondaryBrownColor,
//       splashIconSize: MediaQuery.of(context).size.height,
//       splashTransition: SplashTransition.sizeTransition,
//     );
