import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/core/assets/app_colors.dart';
import 'package:space_app/core/assets/app_styles.dart';
import 'package:space_app/models/planets.dart';
import 'package:space_app/widgets/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  Flutter3DController controller = Flutter3DController();
   DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(topText: Planet.planets[index].name, bottomText: Planet.planets[index].title, isBackButton: true,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
              child: AspectRatio(
                aspectRatio: 1,
                child: Flutter3DViewer(src: Planet.planets[index].model,
                activeGestureInterceptor: true,
                progressBarColor: AppColors.redColor,
                enableTouch: true,
                controller: controller,
                ),
              ),
            ),

            Text('  About', style: AppStyles.bold24White,),
            SizedBox(height: screenSize.height * 0.01,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
              child: Text(Planet.planets[index].about, style: AppStyles.light16White,),
            ),
            SizedBox(height: screenSize.height * 0.04,),
            Text('   Distance from Sun (km) : ${Planet.planets[index].distanceFromSun}', style: AppStyles.bold16White,),
            Text('   Length of Day (hours) : ${Planet.planets[index].lengthOfDay}', style: AppStyles.bold16White,),
            Text('   Orbital Period (Earth years) : ${Planet.planets[index].orbitalPeriod}', style: AppStyles.bold16White,),
            Text('   Radius (km) : ${Planet.planets[index].radius}', style: AppStyles.bold16White,),
            Text('   Mass (kg) : ${Planet.planets[index].mass}', style: AppStyles.bold16White,),
            Text('   Gravity (m/s²) : ${Planet.planets[index].gravity}', style: AppStyles.bold16White,),
            Text('   Surface Area (km²) : ${Planet.planets[index].surfaceArea}', style: AppStyles.bold16White,),

          ],
        ),
      ),
    );
  }
}
