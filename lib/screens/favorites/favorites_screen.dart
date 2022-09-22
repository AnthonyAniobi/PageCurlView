import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/screens/product_details/widget/quantity_button.dart';
import 'package:ntisa_burgers/services/providers/cart_provider.dart';
import 'package:ntisa_burgers/services/providers/favorites_provider.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';
import 'package:ntisa_burgers/widgets/cart_icon.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                AppFont.titleBold('Favorites'),
              ],
            ),
            Expanded(
              child: Consumer<FavoritesProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.favoriteItems.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 110,
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
                                    value.favoriteItems[index].imageUrl)),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppFont.mediumBold(
                                        value.favoriteItems[index].name),
                                    AppFont.smallThin(
                                        value.favoriteItems[index].description,
                                        maxLines: 10),
                                    const SizedBox(height: 5),
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.heartCircleXmark,
                                            size: 15,
                                            color: AppColors.orange,
                                          ),
                                          const SizedBox(width: 5),
                                          AppFont.mediumBold('Remove Favorite ',
                                              color: AppColors.orange),
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
