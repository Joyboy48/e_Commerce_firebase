import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_,index)=>const SizedBox(height: MySize.spaceBtwItems,),
      itemBuilder: (_,index)=> RoundedContainer(
        padding: const EdgeInsets.all(MySize.md),
        showBorder: true,
        backgroundColor: dark?MyColors.dark:MyColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///row1
            Row(
              children: [
                ///icon
                const Icon(Iconsax.ship),
                const SizedBox(width: MySize.spaceBtwItems/2,),
                ///status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:   CrossAxisAlignment.start,
                    children: [
                      Text('Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.primary,fontWeightDelta: 1),
                      ),
                      Text('07 Nov, 2024',style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),
      
                ///icon
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: MySize.iconSm,))
              ],
            ),
            const SizedBox(height: MySize.spaceBtwItems,),
            ///row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: MySize.spaceBtwItems/2,),
                      ///status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:   CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                              style: Theme.of(context).textTheme.labelMedium),
                            Text('[#456f2]',style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ///icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: MySize.spaceBtwItems/2,),
                      ///status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:   CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb, 2025',style: Theme.of(context).textTheme.titleMedium,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      
      
      ),
    );
  }
}
