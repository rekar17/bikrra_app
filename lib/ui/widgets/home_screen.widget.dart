import 'package:bikrra_app/classes/home_screen.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key, required this.homeScreenC});

  final HomeScreenC homeScreenC;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(homeScreenC.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.mainPinkColor.withOpacity(0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: AppColors.mainPinkColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        homeScreenC.text,
                        style: TextStyle(
                          fontFamily: 'Peshang',
                          fontSize: 20,
                          color: AppColors.kButtonsAndSecondaryBrownColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: 5,
          child: Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/wedding-ring.png',
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
