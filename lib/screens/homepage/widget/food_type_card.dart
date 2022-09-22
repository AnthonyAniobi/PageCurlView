import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';

class FoodTypeCard extends StatelessWidget {
  final String name;
  final IconData icon;

  const FoodTypeCard({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.backgroundPink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(
            icon,
            color: AppColors.orange,
          ),
          AppFont.smallBold(name),
        ],
      ),
    );
  }
}
