import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:ntisa_burgers/screens/product_details/product_details.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';

class TopProductCard extends StatelessWidget {
  final ProductModel product;
  const TopProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  void _addToCart(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Added ${product.name} to cart')));
    print('add');
  }

  void _moveToDetail(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _moveToDetail(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 10),
        child: Container(
          width: 150,
          height: 200,
          alignment: Alignment.topCenter,
          // padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.backgroundPink,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.grey.shade300,
                    blurRadius: 2)
              ]),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.imageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppFont.smallBold(product.name, maxLines: 1),
                          AppFont.smallBold("\$${product.price}",
                              color: AppColors.orange),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _addToCart(context);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: AppColors.white,
                          size: 20,
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
