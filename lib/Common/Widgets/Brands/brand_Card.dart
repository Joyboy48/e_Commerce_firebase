import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Common/Widgets/images/circular_images.dart';
import 'package:studio_projects/Common/Widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/enums.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(MySize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                image: ImageStrings.clothIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: HelperFunctions.isDarkMode(context)
                    ? MyColors.white
                    : MyColors.black,
              ),
            ),
            const SizedBox(
              width: MySize.spaceBtwItems / 2,
            ),

            ///texts
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
