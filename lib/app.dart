import "package:studio_projects/Features/Authentication/Screens/OnBoarding/onBoarding.dart";
//import "package:e_commerce_app/Features/Authentication/Screens/onBoarding.dart";
import "package:studio_projects/Utiles/theme/theme.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      home: const onBoardingScreen(),


    );
  }
}

