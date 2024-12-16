import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Features/personalizaion/Screens/address/add_new_address.dart';
import 'package:studio_projects/Features/personalizaion/Screens/address/widget/single_address.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(()=>const AddNewAddressScreen()),
        backgroundColor: MyColors.primary,
        child: const Icon(Iconsax.add,color: MyColors.white,),
      ),
      appBar: MyAppBar(
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true ,
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          children: [
            SingleAddress(selectedAddress: true),
            SingleAddress(selectedAddress: false),
           ]
        ),
        ),
      ),
    );
  }
}
