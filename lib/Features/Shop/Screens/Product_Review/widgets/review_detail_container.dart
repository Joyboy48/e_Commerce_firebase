import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Common/Widgets/products/rating/rating_bar_indicator.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(ImageStrings.userImage1),),
                const SizedBox(width: MySize.spaceBtwItems,),
                Text('qwery',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: MySize.spaceBtwItems,),

        ///review
        Row(
          children: [
            const MyRatingBarIndicator(rating: 4),
            const SizedBox(width: MySize.spaceBtwItems,),
            Text('01 Nov, 2024',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: MySize.spaceBtwItems,),
        const ReadMoreText(
          'The user interface of the app isquite intuitive...................... I was able to navigate and make puschase seamlessly. Great job!',
          trimLines: 2,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: MyColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: MyColors.primary),
        ),
        const SizedBox(height: MySize.spaceBtwItems,),

        ///company review
        RoundedContainer(
          backgroundColor: dark?MyColors.darkerGrey:MyColors.grey,
          child: Padding(padding: const EdgeInsets.all(MySize.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Company',style: Theme.of(context).textTheme.titleMedium,),
                  Text('02 Nov, 2023',style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: MySize.spaceBtwItems,),
              const ReadMoreText(
                'The user interface of the app isquite intuitive...................... I was able to navigate and make puschase seamlessly. Great job!',
                trimLines: 2,
                trimExpandedText: 'Show less',
                trimCollapsedText: 'Show more',
                trimMode: TrimMode.Line,
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: MyColors.primary),
                lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: MyColors.primary),
              ),


            ],
          ),
          ),
        ),
        const SizedBox(height: MySize.spaceBtwSection,)
      ],
    );
  }
}
