import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:ntisa_burgers/screens/product_details/widget/food_info_tile.dart';
import 'package:ntisa_burgers/screens/product_details/widget/quantity_button.dart';
import 'package:ntisa_burgers/services/providers/cart_provider.dart';
import 'package:ntisa_burgers/services/providers/favorites_provider.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void _add() {
    setState(() {
      widget.product.quantity += 1;
    });
  }

  void _remove() {
    setState(() {
      widget.product.quantity -= 1;
    });
  }

  void _addToCart(BuildContext context) {
    CartProvider.of(context).addToCart(widget.product);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: FaIcon(FontAwesomeIcons.arrowLeft)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        FavoritesProvider.of(context)
                            .toggleFavorites(widget.product);
                      });
                    },
                    icon: FavoritesProvider.of(context, listen: true)
                            .isInFavorites(widget.product)
                        ? FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: AppColors.orange,
                          )
                        : FaIcon(FontAwesomeIcons.heart),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  AppFont.titleThin("${widget.product.name.split(' ')[0]} "),
                  AppFont.titleBold(
                      widget.product.name.split(' ').sublist(1).join(' ')),
                ],
              ),
            ),
            const SizedBox(height: 10),
            AspectRatio(
              aspectRatio: 1.2,
              child: Hero(
                tag: widget.product.id,
                child: Image.network(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                FoodInfoTile(title: 'Energy', value: '55kcal'),
                FoodInfoTile(title: 'Weight', value: '800gr'),
                FoodInfoTile(title: 'Delivery', value: '80min'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      QuantityButton(
                        onPressed: _add,
                        buttonType: ButtonType.add,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: AppFont.mediumBold(
                            widget.product.quantity.toString()),
                      ),
                      QuantityButton(
                        onPressed: _remove,
                        buttonType: ButtonType.remove,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFont.smallBold('Description', color: AppColors.grey),
                        AppFont.smallThin(widget.product.description,
                            color: AppColors.grey, maxLines: 10),
                        AppFont.smallBold('Rate', color: AppColors.grey),
                        AppFont.smallThin(widget.product.rate.toString(),
                            color: AppColors.grey),
                        AppFont.smallBold('Country', color: AppColors.grey),
                        AppFont.smallThin(widget.product.country,
                            color: AppColors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          _addToCart(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 17,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 10),
                              AppFont.smallBold('Add to Cart',
                                  color: AppColors.white)
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: AppFont.titleBold('\$${widget.product.price}',
                            color: AppColors.orange),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
