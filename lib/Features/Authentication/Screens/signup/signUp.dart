import 'package:flutter/gestures.dart';
import 'package:studio_projects/Features/Authentication/Screens/signup/verify_email.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/Validators/validation.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:studio_projects/Utiles/constants/texts_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Utiles/HTTP/http_client.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _isAgreed = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void registerUser() async{
    try{
      final response = await HttpHelper.register(
          _firstNameController.text,
          _lastNameController.text,
          _usernameController.text,
          _phoneNumberController.text,
          _emailController.text,
          _passwordController.text,
      );
      HelperFunctions.showSnackBar("registeration successful: ${response['message']}");
      Get.to(()=>const VerifyEmail());
    }catch(e){
      HelperFunctions.showSnackBar('Registration Failed: $e');
    }
}

  // Added method to show policy dialog
  void _showPolicyDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

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
                          controller: _firstNameController,
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
                          controller: _lastNameController,
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
                    controller: _usernameController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.username,
                        prefixIcon: Icon(Iconsax.user_add)),
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputField,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.phoneNo,
                        prefixIcon: Icon(Iconsax.call)),
                    validator: Validator.validatePhoneNumber,
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputField,
                  ),
                  TextFormField(
                    controller: _emailController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                    validator: Validator.validateEmail,
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwInputField,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TextsStrings.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash)),
                    validator: Validator.validatePassword,
                  ),
                  const SizedBox(
                    height: MySize.defaultSpace,
                  ),

                  ///terms and conditions
                  Row(
                    children: [
                      Checkbox( value: _isAgreed,
                        onChanged: (value) {
                        setState(() {
                          _isAgreed = value!;
                        });
                      },
                      ),
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
                                ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _showPolicyDialog(
                                  'Privacy Policy',
                                  'Your privacy is important '
                                      'to us. We are committed'
                                      ' to protecting your personal '
                                      'information and your right to '
                                      'privacy. This Privacy Policy explains'
                                      ' what information we collect, how we us'
                                      'e it, and what rights you have in relation'
                                      ' to it. We collect personal information that'
                                      ' you provide to us such as name, address,'
                                      ' contact information, passwords, and security '
                                      'data. We use this information to provide, operate, '
                                      'and maintain our services, improve, personalize, and'
                                      ' expand our services, and understand and analyze '
                                      'how you use our services.');
                            },
                        ),
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
                                ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _showPolicyDialog(
                                  'Terms of Use',
                                  'By accessing or'
                                      ' using our services,'
                                      ' you agree to be bound '
                                      'by these Terms of Use. You'
                                      ' may use our services only '
                                      'as permitted by law. You must'
                                      ' not misuse our services. For'
                                      ' example, do not interfere with '
                                      'our services or try to access them'
                                      ' using a method other than the '
                                      'interface and the instructions'
                                      ' that we provide. We may suspend'
                                      ' or stop providing our services '
                                      'to you if you do not comply with'
                                      'our terms or policies or if we are'
                                      ' investigating suspected misconduct.'
                                      ' Using our services does not give you '
                                      'ownership of any intellectual property'
                                      ' rights in our services or the content'
                                      ' you access.');
                            },
                        ),
                      ]))
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed:registerUser,
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
