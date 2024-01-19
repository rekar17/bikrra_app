import 'package:bikrra_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSeeAllCategoriesScreen extends StatefulWidget {
  const UserSeeAllCategoriesScreen({super.key});

  @override
  State<UserSeeAllCategoriesScreen> createState() =>
      _UserSeeAllCategoriesScreenState();
}

class _UserSeeAllCategoriesScreenState
    extends State<UserSeeAllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'التصنيفات',
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        //grid view
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => CategoriesWidget(
            key: UniqueKey(),
            image: images[index],
            type: categories[index],
          ),
        ),
      ),
    );
  }
}

//beatiful widget for displaying categories
class CategoriesWidget extends StatelessWidget {
  final String image;
  final String type;

  const CategoriesWidget({
    required Key key,
    required this.image,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.kButtonsAndSecondaryBrownColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              type,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.kButtonsAndSecondaryBrownColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> categories = [
  'دونات',
  'اعياد الميلاد',
  'كيك الزفاف',
  'عروض اسومة',
];

List<String> images = [
  'assets/donut_cake.png',
  'assets/cake_icons/birthday_cake.png',
  'assets/cake_icons/wedding_cake.png',
  'assets/cake_icons/asuma_c.jpeg',
];
