import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';

enum ButtonType { add, remove }

class QuantityButton extends StatelessWidget {
  final Function onPressed;
  final ButtonType buttonType;
  const QuantityButton({
    Key? key,
    required this.onPressed,
    required this.buttonType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 5,
                  color: AppColors.black.withOpacity(0.25))
            ]),
        child: FaIcon(
          buttonType == ButtonType.add
              ? FontAwesomeIcons.plus
              : FontAwesomeIcons.minus,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
