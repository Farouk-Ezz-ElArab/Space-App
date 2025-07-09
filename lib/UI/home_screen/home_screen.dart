import 'package:flutter/material.dart';
import 'package:space_app/core/assets/app3dModels.dart';
import 'package:space_app/core/assets/app_colors.dart';
import 'package:space_app/core/assets/app_images.dart';
import 'package:space_app/core/constants/app_routes.dart';
import 'package:space_app/models/planets.dart';
import 'package:space_app/widgets/CustomElevatedButton.dart';
import 'package:space_app/widgets/custom_app_bar.dart';

import '../../core/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.page! % 1 == 0) {
        index = pageController.page!.toInt() % 9;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          CustomAppBar(
            topText: 'Explore',
            bottomText: 'Which planet \nwould you like to explore?',
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return Image.asset(Planet.planets[index % 9].image);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    index--;
                  },
                  style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  child: Icon(Icons.arrow_back, size: screenSize.width * 0.05),
                ),
                Text(Planet.planets[index].name, style: AppTheme.appTheme.textTheme.titleLarge),
                ElevatedButton(
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    index++;
                  },
                  style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  child: Icon(
                    Icons.arrow_forward,
                    size: screenSize.width * 0.05,
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: CustomElevatedButton(
              text: 'Explore ${Planet.planets[index].name}',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.detailsRoute, arguments: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
