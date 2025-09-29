// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, equal_keys_in_map, unused_import, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bikrra_app/classes/gift.class.dart';
import 'package:bikrra_app/constants/shared_values.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/providers/product_favorite.provider.dart';
import 'package:bikrra_app/ui/screens/login.screen.dart';
import 'package:bikrra_app/ui/screens/user/user_gift_list.screen.dart';
import 'package:bikrra_app/ui/screens/user/user_home.screen.dart';
import 'package:bikrra_app/ui/screens/user/user_order_list.screen.dart';
import 'package:bikrra_app/ui/screens/user/user_product_favorite.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:uni_links2/uni_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedValues.init();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductFavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ProductCartProvider()),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            if (settings.name == '/giftlist') {
              final arguments = settings.arguments;
              if (arguments is String) {
                // Check if arguments is a String
                final uri = Uri.parse(arguments);
                final giftListString = uri.queryParameters['giftList'];

                final giftList = giftListString != null &&
                        giftListString.isNotEmpty
                    ? List<GiftItem>.from(
                        jsonDecode(giftListString) as List<dynamic>)
                    : <GiftItem>[]; // Provide an empty list if the giftList is null or empty

                return MaterialPageRoute(
                  builder: (context) => UserGiftListScreen(giftList: giftList),
                );
              } else {
                // Handle the case where arguments is not a String (e.g., display an error message or navigate to another screen)
                print('Invalid arguments: $arguments');
                return null;
              }
            }
            return null;
          },
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

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
    _handleInitialUri();
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        if (uri.path == '/giftlist') {
          Navigator.pushNamed(context, uri.path, arguments: uri.toString());
        }
      }
    }, onError: (Object err) {
      print('got err: $err');
    });
  }

  Future<void> _handleInitialUri() async {
    try {
      final uri = await getInitialUri();
      if (uri != null) {
        if (uri.path == '/giftlist') {
          Navigator.pushNamed(context, uri.path, arguments: uri.toString());
        }
      }
    } on PlatformException {
      print('Failed to get initial uri.');
    } on FormatException catch (err) {
      print('Malformed uri: $err');
    }
  }

  @override
  void dispose() {
    if (_sub != null) {
      _sub!.cancel();
      _sub = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          UserHomeScreen(),
          UserOrderList(),
          UserProductFavoriteScreen(),
          LoginScreen()
        ],
      ),
    );
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