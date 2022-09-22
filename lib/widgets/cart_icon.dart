import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/services/providers/cart_provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          const FaIcon(FontAwesomeIcons.basketShopping),
          Positioned(
            bottom: 10,
            right: 0,
            child: Container(
              width: 15,
              height: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.orange),
              child: FittedBox(
                child: Text(
                  '${CartProvider.of(context, listen: true).numInCart()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
