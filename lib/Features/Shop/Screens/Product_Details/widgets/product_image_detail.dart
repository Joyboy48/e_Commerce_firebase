import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/custom_shapes/curved_edges/curved_edgesWidgets.dart';
import 'package:studio_projects/Common/Widgets/icons/circular_icon.dart';
import 'package:studio_projects/Common/Widgets/images/rounded_images.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ClipPath(
      child: CurvedEdgeWidget(
        child: Container(
          color: dark ? MyColors.darkerGrey : MyColors.light,
          child: Stack(
            children: [
              ///main large image
              const SizedBox(
                  height: 400,
                  child: Padding(
                      padding:
                      EdgeInsets.all(MySize.productImageRadius * 2),
                      child: Center(
                          child: Image(
                              image: AssetImage(ImageStrings.bat1))))),

              ///ImageSlider
              Positioned(
                right: 0,
                bottom: 30,
                left:  MySize.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_,index)=>RoundedImage(
                      imageUrl: ImageStrings.bat1,
                      width: 80,
                      backgroundColor: dark?MyColors.dark:MyColors.white,
                      border: Border.all(color: MyColors.primary),
                      padding: const EdgeInsets.all(MySize.sm),

                    ),
                    separatorBuilder: (_,__)=>const SizedBox(width: MySize.spaceBtwItems,),

                  ),
                ),
              ),
              ///Appbar Icons
              const MyAppBar(
                showBackArrow: true,
                actions: [
                  CircularIcon(icon: Iconsax.heart5,color: Colors.red,)
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}
