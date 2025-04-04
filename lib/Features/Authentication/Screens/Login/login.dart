import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio_projects/Common/Styles/spaceing_style.dart';
import 'package:studio_projects/Features/Authentication/Screens/password_config/forget_password.dart';
import 'package:studio_projects/Features/Authentication/Screens/signup/signUp.dart';
import 'package:studio_projects/Utiles/HTTP/http_client.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:studio_projects/Utiles/constants/texts_strings.dart';
import 'package:studio_projects/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../personalizaion/Screens/profile/profile.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();

}

class _loginPageState extends State<loginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await HttpHelper.login(
        _emailController.text,
        _passwordController.text,
      );

      print('Response: $response');

      if (response != null && response.containsKey('data') && response['data'].containsKey('accessToken')) {
        final accessToken = response['data']['accessToken'];
        // Store the accessToken securely using SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);

        // Navigate to the ProfileScreen
        Get.off(() => ProfileScreen(token: accessToken));
      } else {
        HelperFunctions.showSnackBar("Login failed: Invalid response");
      }
    } catch (e) {
      HelperFunctions.showSnackBar("Login failed: $e");
    }  finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: spaceingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      height: 150,
                      image: AssetImage(dark
                          ? ImageStrings.lightAppLogo
                          : ImageStrings.darkAppLogo)),
                  Text(
                    "Welcome back,",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "Discover Limitless Choice  and  Unmatched Convenience.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),

              ///form
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: MySize.spaceBtwSection),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.direct_right,
                        ),
                        labelText: TextsStrings.email,
                      ),
                    ),
                    const SizedBox(
                      height: MySize.spaceBtwInputField,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.password_check,
                          ),
                          labelText: TextsStrings.password,
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    const SizedBox(
                      height: MySize.spaceBtwInputField / 2,
                    ),

                    ///Remember me & forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///remember me
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const Text(TextsStrings.rememberMe)
                          ],
                        ),

                        ///forge password
                        TextButton(
                            onPressed: () => Get.to(()=> const ForgetPassword()),
                            child: const Text(TextsStrings.forgetPassword))
                      ],
                    ),
                    const SizedBox(
                      height: MySize.spaceBtwSection,
                    ),

                    ///sign button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: _login, child: const Text(TextsStrings.signIn)),
                    ),
                    const SizedBox(
                      height: MySize.spaceBtwItems,
                    ),

                    ///Create account Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            Get.to(()=> const SignUpPage());
                          },
                          child: const Text(TextsStrings.createAccount)),
                    ),

                  ],
                )),
              ),
              ///divider
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
          ),
        ),
      ),
    );
  }
}
