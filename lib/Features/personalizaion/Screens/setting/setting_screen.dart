import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/custom_shapes/container/primary_headerContainer.dart';
import 'package:studio_projects/Common/Widgets/list_tile/settings_menu_tile.dart';
import 'package:studio_projects/Common/Widgets/list_tile/user_profile_tile.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Features/Shop/Screens/cart/cart.dart';
import 'package:studio_projects/Features/Shop/Screens/order/order.dart';
import 'package:studio_projects/Features/personalizaion/Screens/address/address.dart';
import 'package:studio_projects/Features/personalizaion/Screens/profile/profile.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _navigateToProfileScreen(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    Get.to(() => ProfileScreen(token: token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            primaryHeaderContainer(child: Column(
              children: [
                ///appbar
                MyAppBar(title: Text('Account',
                  style: Theme.of(context).textTheme.headlineMedium!.apply(color: MyColors.white),),
                ),
                //SizedBox(height: MySize.spaceBtwSection ,),
                ///userprofile
                userProfileTile(onPressed: ()=>_navigateToProfileScreen(context)),
                const SizedBox(height: MySize.spaceBtwSection,)
              ],
            ),),
            ///body
            Padding(padding: const EdgeInsets.all(MySize.defaultSpace),
            child: Column(
              children: [
                ///title
                const SectionHeading(title: "Account Setting",showActionButton: false,),
                //SizedBox(height: MySize.spaceBtwItems,),

                SettingsMenuTile(icon: Iconsax.safe_home, title:'My Address', subtitle: 'Set Shopping Delivery Address',onTap: ()=>Get.to(()=>const UserAddressScreen()),),
                SettingsMenuTile(icon: Iconsax.shopping_cart, title:'My cart', subtitle: 'Add,remove product and move to check out',onTap: ()=>Get.to(()=>const MyCart()),),
                SettingsMenuTile(icon: Iconsax.bag_tick, title:'My order', subtitle: 'In-Prograss and Completed orders',onTap: ()=>Get.to(()=>const OrderScreen()),),
                SettingsMenuTile(icon: Iconsax.bank, title:'Bank Account', subtitle: 'Withdraw Balance to registered bank account',onTap: (){},),
                SettingsMenuTile(icon: Iconsax.discount_shape, title:'My coupons', subtitle: 'List of all discount Coupons',onTap: (){},),
                SettingsMenuTile(icon: Iconsax.notification, title:'Notifications', subtitle: 'Set any kind of notification message',onTap: (){},),
                SettingsMenuTile(icon: Iconsax.security_card, title:'Account Privacy', subtitle: 'Manage data usage and connected accounts',onTap: (){},),

                ///app setings
                const SizedBox(height: MySize.spaceBtwSection,),
                const SectionHeading(title: 'App Settingsḍ',showActionButton: false,),
                const SizedBox(height: MySize.spaceBtwItems,),
                SettingsMenuTile(icon: Iconsax.document_upload, title:'Load Data', subtitle: 'Upload data to your cloud Firestore',onTap: (){},),
                SettingsMenuTile(icon: Iconsax.location,trailing: Switch(value: true, onChanged: (value){}), title:'Geolocation ', subtitle: 'Set recommendation based on location'),
                SettingsMenuTile(icon: Iconsax.security_user,trailing: Switch(value: false, onChanged: (value){}), title:'Safe mode', subtitle: 'Search result is safe for all users',),
                SettingsMenuTile(icon: Iconsax.image,trailing: Switch(value: false, onChanged: (value){}), title:'HD Image quality', subtitle: 'Set image quality to be seen',),


              ],
            ),),

          ],
        ),
      ),
    );}
  }




