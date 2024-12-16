import 'package:studio_projects/Common/Styles/shadows.dart';
import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Common/Widgets/icons/circular_icon.dart';
import 'package:studio_projects/Common/Widgets/images/rounded_images.dart';
import 'package:studio_projects/Common/Widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:studio_projects/Common/Widgets/texts/product_price_text.dart';
import 'package:studio_projects/Common/Widgets/texts/product_title_text.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Details/product_details.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MySize.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(
          children: [
            ///thumbnail-- discount--wishlist
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(MySize.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  //image
                  RoundedImage(
                    imageUrl: ImageStrings.bat1,
                    applyImageRadius: true,
                  ),
                  //-sale tag
                  Positioned(
                    top: 10,
                    child: RoundedContainer(
                      radius: MySize.sm,
                      backgroundColor: MyColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: MySize.sm, vertical: MySize.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: MyColors.black),
                      ),
                    ),
                  ),

                  ///fav icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: MySize.spaceBtwItems / 2,
            ),

            ///details-
            const Padding(
              padding: EdgeInsets.only(left: MySize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: 'Leather Cricket Bat',
                    smallSize: true,

                  ),
                  SizedBox(
                    height: MySize.spaceBtwItems / 2,
                  ),
                  BrandTitleTextWithVerifiedIcon(title: 'SS'),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const productPriceText(price: '2000',
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: MyColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.cardRadiusMd),
                        bottomRight:
                        Radius.circular(MySize.productImageRadius)),
                  ),
                  child: const SizedBox(
                      width: MySize.iconLg ,
                      height: MySize.iconLg ,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: MyColors.white,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

