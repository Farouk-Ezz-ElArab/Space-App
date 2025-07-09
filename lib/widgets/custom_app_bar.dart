import 'package:flutter/material.dart';
import 'package:space_app/core/assets/app_colors.dart';
import 'package:space_app/core/assets/app_images.dart';
import 'package:space_app/core/assets/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String topText, bottomText;
  final bool isBackButton;
  const CustomAppBar({
    super.key,
    required this.topText,
    required this.bottomText,
    this.isBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(AppImages.homeScreenTopImage),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.blackColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenSize.height * 0.02),
                  (isBackButton)
                      ? Row(
                          children: [
                            SizedBox(width: screenSize.width * 0.02),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: screenSize.width * 0.05,
                              ),
                            ),
                            SizedBox(width: screenSize.width * 0.23,),
                            Text(
                                topText,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge /*AppStyles.bold24White*/,
                                textAlign: TextAlign.center,
                              ),
                          ],
                        )
                      : Text(
                          topText,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge /*AppStyles.bold24White*/,
                          textAlign: TextAlign.center,
                        ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.02,
                    ),
                    child: Text(bottomText, style: AppStyles.bold24White),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* Stack(
      children: [
        Image.asset(AppImages.homeScreenTopImage),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.blackColor,
                Colors.transparent,
              ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        )
      ],
    );*/

/*Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.homeScreenTopImage)),
        gradient: LinearGradient(
          colors: [AppColors.blackColor, AppColors.blackColor.withValues(alpha: 0.6), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120,),
              Text(topText, style: AppStyles.bold24White,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(bottomText, style: AppStyles.bold24White,),
          ),
        ],
      ),
    )*/
