import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDetails()),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySize.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.lightContainer,
        ),
        child: Row(
          children: [
            ///Thumbnail
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(MySize.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  SizedBox(
                      height: 120,
                      width: 120,
                      child: RoundedImage(
                        imageUrl: ImageStrings.bat1,
                        applyImageRadius: true,
                      )),
                  Positioned(
                    top: 12,
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
                ),),
                ],
              ),
            ),
            const SizedBox(width: MySize.spaceBtwItems,),
            ///Details
            SizedBox(
              width: 145,
              child: Padding(
                padding: const EdgeInsets.only(top: MySize.sm,left: MySize.sm),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitleText(title: 'Green shrt asdf asdjhg fajhgeui weufigksj',smallSize: true,),
                        SizedBox(height: MySize.spaceBtwItems/2,),
                        BrandTitleTextWithVerifiedIcon(title: 'Nike',)
                      ],
                    ),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(child: productPriceText(price:  '2000')),
                        ///Add to cart
                        Container(
                          decoration: const BoxDecoration(
                            color: MyColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MySize.cardRadiusMd),
                                bottomRight:
                                Radius.circular(MySize.productImageRadius)),
                          ),
                          child: const SizedBox(
                              width: MySize.iconMd* 1.2,
                              height: MySize.iconMd * 1.2 ,
                              child: Center(
                                child: Icon(
                                  Iconsax.add,
                                  color: MyColors.white,
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
