import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                FaIcon(FontAwesomeIcons.heart),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                AppFont.titleThin("${product.name.split(' ')[0]} "),
                AppFont.titleBold(product.name.split(' ').sublist(1).join(' ')),
              ],
            ),
          ),
          Image.network(product.imageUrl),
        ],
      ),
    );
  }
}
