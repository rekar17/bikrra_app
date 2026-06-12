import 'package:bikrra_app/classes/product.class.dart';
import 'package:bikrra_app/constants/app_colors.dart';
import 'package:bikrra_app/providers/product_cart.provider.dart';
import 'package:bikrra_app/providers/product_favorite.provider.dart';
import 'package:bikrra_app/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserSingleProductScreen extends StatefulWidget {
  final ProductC product;

  const UserSingleProductScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<UserSingleProductScreen> createState() =>
      _UserSingleProductScreenState();
}

class _UserSingleProductScreenState extends State<UserSingleProductScreen> {
  int count = 1;

  int get totalPrice => count * widget.product.price;

  void _changeQuantity(int value) {
    setState(() {
      count = (count + value).clamp(1, 99);
    });
  }

  void _addToCart() {
    context.read<ProductCartProvider>().addProduct(
          ProductC(
            id: widget.product.id,
            name: widget.product.name,
            description: widget.product.description,
            price: widget.product.price,
            image: widget.product.image,
            category: widget.product.category,
            quantity: count,
          ),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ØªÙ… Ø§Ø¶Ø§ÙØ© Ø§Ù„Ù…Ù†ØªØ¬ Ø§Ù„Ù‰ Ø§Ù„Ø³Ù„Ø©'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<ProductFavoriteProvider>().isFavorite(
          widget.product,
        );

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FA),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _addToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainPinkColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(FontAwesomeIcons.cartShopping, size: 18),
            label: const Text(
              'Ø§Ø¶Ø§ÙØ© Ø§Ù„Ù‰ Ø§Ù„Ø³Ù„Ø©',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.mainPinkColor,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: _HeaderButton(
                icon: FontAwesomeIcons.chevronRight,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: _HeaderButton(
                  icon: isFavorite
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  iconColor: AppColors.mainPinkColor,
                  onPressed: () {
                    final favoriteProvider =
                        context.read<ProductFavoriteProvider>();
                    if (isFavorite) {
                      favoriteProvider.removeProduct(widget.product);
                    } else {
                      favoriteProvider.addProduct(widget.product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'ØªÙ… Ø§Ø¶Ø§ÙØ© Ø§Ù„Ù…Ù†ØªØ¬ Ø§Ù„Ù‰ Ø§Ù„Ù…ÙØ¶Ù„Ø©',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(widget.product.image, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.08),
                          AppColors.mainPinkColor.withValues(alpha: 0.18),
                          Colors.black.withValues(alpha: 0.35),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -22),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF8FA),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          _PricePill(price: widget.product.price),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _PurchaseSummary(
                        count: count,
                        totalPrice: totalPrice,
                        onMinus: () => _changeQuantity(-1),
                        onPlus: () => _changeQuantity(1),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const _HeaderButton({
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.92),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor, size: 18),
      ),
    );
  }
}

class _PricePill extends StatelessWidget {
  final int price;

  const _PricePill({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cakePinkColor),
      ),
      child: Text(
        '${priceWithComma(price)} Ø¯ÙŠÙ†Ø§Ø±',
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.mainPinkColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _PurchaseSummary extends StatelessWidget {
  final int count;
  final int totalPrice;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const _PurchaseSummary({
    required this.count,
    required this.totalPrice,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainPinkColor.withValues(alpha: 0.16),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ø§Ù„Ø³Ø¹Ø± Ø§Ù„ÙƒÙ„ÙŠ',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${priceWithComma(totalPrice)} Ø¯ÙŠÙ†Ø§Ø±',
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.kButtonsAndSecondaryBrownColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _QuantityStepper(count: count, onMinus: onMinus, onPlus: onPlus),
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int count;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const _QuantityStepper({
    required this.count,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEF4),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperButton(icon: FontAwesomeIcons.minus, onPressed: onMinus),
          SizedBox(
            width: 42,
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.kButtonsAndSecondaryBrownColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _StepperButton(icon: FontAwesomeIcons.plus, onPressed: onPlus),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _StepperButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 14),
      color: AppColors.mainPinkColor,
      splashRadius: 22,
    );
  }
}
