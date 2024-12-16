import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Common/Widgets/images/circular_images.dart';
import 'package:studio_projects/Common/Widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:studio_projects/Common/Widgets/texts/product_price_text.dart';
import 'package:studio_projects/Common/Widgets/texts/product_title_text.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/enums.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price and sale price
        Row(
          children: [
            ///sale tag
            RoundedContainer(
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
            const SizedBox(width: MySize.spaceBtwItems,),
            ///Price
            Text('₹3000',style: Theme.of(context).textTheme.headlineSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: MySize.spaceBtwItems,),
            const productPriceText(price: '2250',)
          ],
        ),
        const SizedBox(height: MySize.spaceBtwItems,),
        ///Title
        const ProductTitleText(title: 'Leather Cricket Bat' ),
        const SizedBox(height: MySize.spaceBtwItems,),
        ///Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: MySize.spaceBtwItems,),

            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: MySize.spaceBtwItems/2,),
        ///Brand
        Row(
          children: [
            CircularImage(image: ImageStrings.cosmeticIcon,
            width: 32,
            height: 32,
            overlayColor: dark?MyColors.white:MyColors.black,),
            const SizedBox(width: MySize.spaceBtwItems/2,),
            const BrandTitleTextWithVerifiedIcon(title: 'SS',brandTextSize: TextSizes.large,),
          ],
        )

      ],
    );
  }
}
