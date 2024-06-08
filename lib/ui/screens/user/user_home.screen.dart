// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, unused_import

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bikrra_app/classes/home_screen.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/constants/methods.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/ui/screens/user/user_order_list.screen.dart';
import 'package:bikrra_app/ui/screens/user/user_product_favorite.screen.dart';
import 'package:bikrra_app/ui/screens/user/user_see_all_categories.screen.dart'
    hide CategoriesWidget;
import 'package:bikrra_app/ui/screens/user/user_shopping_cart.screen.dart';
import 'package:bikrra_app/ui/widgets/categories.widget.dart';
import 'package:bikrra_app/ui/widgets/home_screen.widget.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../product_list.screen.dart';

class UserHomeScreen extends StatefulWidget {
  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // late Stream<QuerySnapshot> data;

  int activeIndex = 3;
  int carouselIndex = 0;
  @override
  void initState() {
    // data = firestore
    //     .collection('Items')
    //     .where('type', isEqualTo: 'Donates')
    //     .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bikrra',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Arial',
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/bikrra_logo.jpeg',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ],
        ),
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  pushScreen(context, UserShoppingCartScreen());
                },
                child: Icon(
                  FontAwesomeIcons.cartPlus,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 12,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppColors.mainPinkColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    context
                        .watch<ProductCartProvider>()
                        .productCount
                        .toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              FontAwesomeIcons.bell,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomBar(
            backgroundColor: AppColors.mainPinkColor,
            selectedIndex: activeIndex,
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });
            },
            items: [
              BottomBarItem(
                activeColor: Colors.white,
                icon: CircleAvatar(
                  backgroundColor:
                      activeIndex == 0 ? Colors.white : Colors.transparent,
                  child: Icon(
                    FontAwesomeIcons.userLarge,
                    color: activeIndex == 0
                        ? AppColors.mainPinkColor
                        : Colors.white,
                  ),
                ),
                title: null,
              ),
              BottomBarItem(
                activeColor: Colors.white,
                icon: GestureDetector(
                  onTap: () {
                    pushScreen(context, UserProductFavoriteScreen());
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        activeIndex == 1 ? Colors.white : Colors.transparent,
                    child: Icon(
                      FontAwesomeIcons.heart,
                      color: activeIndex == 1
                          ? AppColors.mainPinkColor
                          : Colors.white,
                    ),
                  ),
                ),
                title: null,
              ),
              BottomBarItem(
                activeColor: Colors.white,
                icon: GestureDetector(
                  onTap: () {
                    pushScreen(context, UserOrderList());
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        activeIndex == 2 ? Colors.white : Colors.transparent,
                    child: Icon(
                      FontAwesomeIcons.bagShopping,
                      color: activeIndex == 2
                          ? AppColors.mainPinkColor
                          : Colors.white,
                    ),
                  ),
                ),
                title: null,
              ),
              BottomBarItem(
                activeColor: Colors.white,
                icon: CircleAvatar(
                  backgroundColor:
                      activeIndex == 3 ? Colors.white : Colors.transparent,
                  child: Icon(
                    FontAwesomeIcons.house,
                    color: activeIndex == 3
                        ? AppColors.mainPinkColor
                        : Colors.white,
                  ),
                ),
              ),
            ]),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'گەران',
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Peshang',
                    color: AppColors.textColor.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: AppColors.textColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.mainPinkColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.mainPinkColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.mainPinkColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
                options: CarouselOptions(
                  clipBehavior: Clip.none,
                  height: 180,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      carouselIndex = index;
                    });
                  },
                ),
                items: [
                  HomeScreenWidget(
                      homeScreenC: HomeScreenC(
                    image: 'assets/wedding_image.png',
                    text: 'هۆڵی گونجاو هەڵبژێرە',
                  )),
                  HomeScreenWidget(
                      homeScreenC: HomeScreenC(
                    image: 'assets/wedding_card.jpg',
                    text: 'کارتی بانگەشە داوا بکە',
                  )),
                ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'بەشەکان',
                    style: TextStyle(
                      fontFamily: 'Peshang',
                      fontSize: 24,
                      color: AppColors.kButtonsAndSecondaryBrownColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  CategoryWidget(
                    type: 'مۆبیلیا',
                    image: 'assets/category_icons/armchair.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryWidget(
                    type: 'فاشیۆن دیزاینەر',
                    image: 'assets/category_icons/gown.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryWidget(
                    type: 'هۆڵی ئاهەنگ',
                    image: 'assets/category_icons/hall.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryWidget(
                    type: 'ئارایشگا',
                    image: 'assets/category_icons/makeup.png',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CategoryWidget(
                    type: 'فۆتۆگرافەر',
                    image: 'assets/category_icons/photographer.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'بەرهەمەکان',
                    style: TextStyle(
                      fontFamily: 'Peshang',
                      fontSize: 24,
                      color: AppColors.kButtonsAndSecondaryBrownColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'هەموو بەرهەمەکان',
                        style: TextStyle(
                          fontFamily: 'Peshang',
                          fontSize: 16,
                          color: AppColors.kButtonsAndSecondaryBrownColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 16,
                        color: AppColors.kButtonsAndSecondaryBrownColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ProductListScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
