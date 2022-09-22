import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/constants/app_images.dart';
import 'package:ntisa_burgers/screens/homepage/widget/top_products_list.dart';
import 'package:ntisa_burgers/screens/homepage/widget/food_type_card.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  const SizedBox(width: 20),
                  AppFont.titleThin('Hi'),
                  AppFont.titleBold(' Anthony!'),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                          ),
                          hintText: 'Find what you want',
                          hintStyle: const TextStyle(color: AppColors.grey),
                          fillColor: AppColors.backgroundPink,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 105,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppFont.mediumBold('Free Combo',
                                  color: AppColors.white),
                              const SizedBox(height: 5),
                              AppFont.smallThin(
                                  'Burger + Coca cola\nfor new users',
                                  color: AppColors.white),
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 30,
                      child: Image.asset(
                        AppImages.cocaCola,
                        height: 140,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 35,
                      child: Image.asset(
                        AppImages.burger,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    FoodTypeCard(name: 'Burger', icon: FontAwesomeIcons.burger),
                    FoodTypeCard(
                        name: 'Pizza', icon: FontAwesomeIcons.pizzaSlice),
                    FoodTypeCard(
                        name: 'Drinks', icon: FontAwesomeIcons.wineGlass),
                    FoodTypeCard(
                        name: 'Cake', icon: FontAwesomeIcons.cakeCandles),
                    FoodTypeCard(
                        name: 'Whiskey', icon: FontAwesomeIcons.whiskeyGlass),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AppFont.mediumBold('Top Products'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 210,
                width: MediaQuery.of(context).size.width,
                child: const TopProductsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
