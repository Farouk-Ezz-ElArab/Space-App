import 'package:flutter/material.dart';
import 'package:space_app/core/assets/app_images.dart';
import 'package:space_app/core/assets/app_styles.dart';
import 'package:space_app/core/constants/app_routes.dart';
import 'package:space_app/widgets/CustomElevatedButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              AppImages.splashImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                SizedBox(width: screenSize.width * 0.04),
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    child: Text(
                      'Explore \nThe \nUniverse ',
                      style: AppStyles.bold48White,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: CustomElevatedButton(text: 'Explore', onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
