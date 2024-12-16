import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/products/rating/rating_bar_indicator.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Review/widgets/rating_progress_indicator.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Review/widgets/review_detail_container.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: const MyAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      ///Body
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Text("Ratings and  Reviews are Verifier and are from people who use the same type of device that you use."),
            const SizedBox(height: MySize.spaceBtwItems,),

            ///overall product rating
            const OverallProductRating(),
            const MyRatingBarIndicator(rating: 3.5,),
            Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: MySize.spaceBtwItems,),

            ///User review list
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),

          ],
        ),
        ),
      ),
    );
  }
}




