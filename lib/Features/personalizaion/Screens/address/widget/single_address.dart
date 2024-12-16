import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(MySize.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? MyColors.primary.withOpacity(0.5):Colors.transparent,
      borderColor: selectedAddress?Colors.transparent:dark?MyColors.darkerGrey:MyColors.grey,
      margin: const EdgeInsets.only(bottom: MySize.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,top: 0,
            child: Icon(
              selectedAddress?Iconsax.tick_circle:null,color: selectedAddress?dark?MyColors.light:MyColors.dark:null,
            
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Astitva Arya',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: MySize.sm/2,),
              const Text('+91-6969696969',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: MySize.sm/2,),
              const Text('45688 Qwerty  sdfjh sd,oisdjfl , ekp, India', softWrap: true,),
              const SizedBox(height: MySize.sm/2,),
            ],
          )
        ],
      ),

    );
  }
}
