import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/screens/product_details/widget/quantity_button.dart';
import 'package:ntisa_burgers/services/providers/cart_provider.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';
import 'package:ntisa_burgers/widgets/cart_icon.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFont.titleBold('Cart'),
                AppFont.mediumBold(
                    CartProvider.of(context, listen: true)
                        .numInCart()
                        .toString(),
                    color: AppColors.orange),
              ],
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 140,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(2, 2),
                                    blurRadius: 5,
                                    color: AppColors.black.withOpacity(0.25))
                              ]),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(10)),
                                child: Image.network(
                                    value.cartItems[index].imageUrl)),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppFont.mediumBold(
                                        value.cartItems[index].name),
                                    AppFont.smallThin(
                                        value.cartItems[index].description,
                                        maxLines: 10),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            QuantityButton(
                                                onPressed: () {
                                                  value.cartItems[index]
                                                      .quantity += 1;
                                                },
                                                buttonType: ButtonType.add),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: AppFont.mediumBold(value
                                                  .cartItems[index].quantity
                                                  .toString()),
                                            ),
                                            QuantityButton(
                                                onPressed: () {
                                                  value.cartItems[index]
                                                      .quantity -= 1;
                                                },
                                                buttonType: ButtonType.remove),
                                          ],
                                        ),
                                        const Spacer(),
                                        AppFont.mediumBold(
                                            '\$${double.parse(value.cartItems[index].price) * value.cartItems[index].quantity}',
                                            color: AppColors.orange),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          AppFont.mediumBold('Delete ',
                                              color: AppColors.orange),
                                          const FaIcon(
                                            FontAwesomeIcons.trashCan,
                                            size: 15,
                                            color: AppColors.orange,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        );
                      }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
