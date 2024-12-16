import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:studio_projects/Utiles/constants/texts_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            children: [
              ///Image
              const Image(image: AssetImage(ImageStrings.cat3)),
              const SizedBox(height: MySize.defaultSpace,),
              ///Title and Subtitle
              Text(
                TextsStrings.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MySize.defaultSpace,),
              Text(
                TextsStrings.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: MySize.defaultSpace,),
              ///Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text("Continue")),
              ),
              const SizedBox(height: MySize.defaultSpace,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: const Text(TextsStrings.resendEmail)),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
