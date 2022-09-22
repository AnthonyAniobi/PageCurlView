import 'package:flutter/material.dart';
import 'package:ntisa_burgers/constants/app_colors.dart';

class AppFont {
  static Text titleThin(String data,
          {Color color = AppColors.black, int? maxLines}) =>
      Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 30,
          color: color,
          fontWeight: FontWeight.w300,
        ),
      );
  static Text titleBold(String data,
          {Color color = AppColors.black, int? maxLines}) =>
      Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 30,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      );
  static Text mediumThin(String data,
          {Color color = AppColors.black, int? maxLines}) =>
      Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,
          color: color,
          fontWeight: FontWeight.w300,
        ),
      );
  static Text mediumBold(String data,
          {Color color = AppColors.black, int? maxLines}) =>
      Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      );
  static Text smallThin(String data,
          {Color color = AppColors.black, int? maxLines}) =>
      Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15,
          color: color,
          fontWeight: FontWeight.w400,
        ),
      );
  static Text smallBold(String data,
          {Color color = AppColors.black, int? maxLines}) =>
      Text(
        data,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      );
}
