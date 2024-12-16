import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/images/circular_images.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Features/personalizaion/Screens/profile/widget/profile_menu.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      ///Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          children: [
            ///profilePic
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CircularImage(image: ImageStrings.userImage1,width: 80,height: 80,),
                  TextButton(onPressed: (){}, child: const Text('Change Proflie Picture'))
                ],
              ),
            ),
            ///Details
            const SizedBox(height: MySize.spaceBtwItems/2,),
            const Divider(),
            const SizedBox(height: MySize.spaceBtwItems,),
            const SectionHeading(title: 'Profile Information',showActionButton: false,),
            const SizedBox(height: MySize.spaceBtwItems,),

            ProfileMenu(onPressed: () {}, title: 'Name', value: 'Astitva Arya',),
            ProfileMenu(onPressed: () {}, title: 'Username', value: 'astitva_arya',),
            const SizedBox(height: MySize.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: MySize.spaceBtwItems,),
            const SectionHeading(title: 'Personal Information',showActionButton: false,),
            const SizedBox(height: MySize.spaceBtwItems,),

            ProfileMenu(onPressed: () {}, title: 'User ID',icon: Iconsax.copy, value: '696969',),
            ProfileMenu(onPressed: () {}, title: 'E-mail', value: 'qwerty1234@gmail.com',),
            ProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+91-6853658363',),
            ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male',),
            ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '02 Aug, 2004',),
            const Divider(),

            Center(
              child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red ),)),
            )

          ],
        ),
      ),

    );
  }
}

