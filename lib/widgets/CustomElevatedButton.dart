import 'package:flutter/material.dart';
import 'package:space_app/core/assets/app_colors.dart';
import 'package:space_app/core/assets/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(29)
          ),
          backgroundColor: AppColors.redColor,
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: AppStyles.semiBold20White),
            Icon(Icons.arrow_forward, size: screenSize.width*0.07,),
          ],
        ),
      ),
    );
  }
}
