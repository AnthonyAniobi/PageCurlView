import 'package:flutter/material.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';
import 'package:ntisa_burgers/widgets/app_fonts.dart';

class FoodInfoTile extends StatelessWidget {
  final String title;
  final String value;
  const FoodInfoTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFont.mediumBold(value),
        AppFont.smallThin(title, color: AppColors.orange),
      ],
    );
  }
}
