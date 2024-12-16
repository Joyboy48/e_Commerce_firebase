import 'package:studio_projects/Common/Widgets/images/rounded_images.dart';
import 'package:studio_projects/Common/Widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:studio_projects/Common/Widgets/texts/product_title_text.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class cartItem extends StatelessWidget {
  const cartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        RoundedImage(
          imageUrl: ImageStrings.bat1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(MySize.sm),
          backgroundColor: HelperFunctions.isDarkMode(context)?MyColors.darkerGrey:MyColors.light,
        ),
        const SizedBox(width: MySize.spaceBtwItems,),
        ///Title price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              const BrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: ProductTitleText(title: 'Black Sports Shoes',maxLines: 1,)),
              ///Attribute
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color : ',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ',style: Theme.of(context).textTheme.bodyLarge),

                        TextSpan(text: 'Size : ',style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'XL ',style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              ),
            ],
          ),
        )
      ],
    );
  }
}
