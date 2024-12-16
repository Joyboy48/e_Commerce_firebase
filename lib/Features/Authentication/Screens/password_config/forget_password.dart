import 'package:studio_projects/Features/Authentication/Screens/password_config/reset_password.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:studio_projects/Utiles/constants/texts_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            Text(
              TextsStrings.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: MySize.spaceBtwItems,
            ),
            Text(
              TextsStrings.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: MySize.spaceBtwItems,
            ),

            ///Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: TextsStrings.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(
              height: MySize.defaultSpace,
            ),

            ///Submit Button
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(
              onPressed: () => Get.off(()=>const ResetPassword()),
              child: const Text("Submit"),
            ))
          ],
        ),
      ),
    );
  }
}
