import 'package:studio_projects/Features/Authentication/Screens/signup/verify_email.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:studio_projects/Utiles/constants/texts_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class signUpPage extends StatelessWidget {
  const signUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                TextsStrings.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: MySize.spaceBtwSection,
              ),

              ///Form
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child:  TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: TextsStrings.firstName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                      const SizedBox(
                        width: MySize.spaceBtwItems,
                      ),
                      Expanded(
                        child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: TextsStrings.LastName,
                              prefixIcon: Icon(Iconsax.user)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwItems,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.username,
                        prefixIcon: Icon(Iconsax.user_add)),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputField,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.phoneNo,
                        prefixIcon: Icon(Iconsax.call)),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputField,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputField,
                  ),
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash)),
                  ),
                  const SizedBox(
                    height: MySize.defaultSpace,
                  ),

                  ///terms and conditions
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${TextsStrings.iAgreeTo}  ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: '${TextsStrings.privacyPolicy}  ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color:
                                      dark ? MyColors.white : MyColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      dark ? MyColors.white : MyColors.primary,
                                )),
                        TextSpan(
                            text: '${TextsStrings.and}  ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: TextsStrings.termsOfUse,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color:
                                      dark ? MyColors.white : MyColors.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      dark ? MyColors.white : MyColors.primary,
                                )),
                      ]))
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(()=>const VerifyEmail()),
                        child: const Text(TextsStrings.createAccount)),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          color: dark ? MyColors.darkGrey : MyColors.grey,
                          thickness: 0.5,
                          indent: 60,
                          endIndent: 5,
                        ),
                      ),
                      Text(TextsStrings.orSignInWith.capitalize!,style: Theme.of(context).textTheme.labelMedium,),
                      Flexible(
                        child: Divider(
                          color: dark ? MyColors.darkGrey : MyColors.grey,
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 60,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwItems,
                  ),

                  ///Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(onPressed: (){},
                            icon: const Image(
                                width: MySize.iconMd,
                                height: MySize.iconMd,
                                image: AssetImage(ImageStrings.google))),
                      ),
                      const SizedBox(
                        width: MySize.spaceBtwItems,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(onPressed: (){},
                            icon: const Image(
                                width: MySize.iconMd,
                                height: MySize.iconMd,
                                image: AssetImage(ImageStrings.fackbook))),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
