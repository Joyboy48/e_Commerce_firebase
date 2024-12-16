import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Details/widgets/bottom_add_to_cart.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Details/widgets/product_attributes.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Details/widgets/product_image_detail.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Details/widgets/product_meta_data.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Details/widgets/rating_share_widget.dart';
import 'package:studio_projects/Features/Shop/Screens/Product_Review/product_review.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ///Product image slider
            const ProductImageSlider(),

            ///product image
            Padding(
              padding: const EdgeInsets.only(right: MySize.defaultSpace,left: MySize.defaultSpace,bottom: MySize.defaultSpace),
              child: Column(
                children: [
                  ///Rating and Share
                  const RatingandShare(),
                  SizedBox(height: MySize.spaceBtwItems/2,),
                  ///Price title
                  const ProductMetaData(),
                  SizedBox(height: MySize.spaceBtwItems/2,),

                  ///attribute
                  const ProductAttributes(),
                  const SizedBox(height: MySize.spaceBtwSection,),
                  ///Checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){}, child:const Text('CheckOut'))),
                  const SizedBox(height: MySize.spaceBtwItems,),

                  ///Description
                  const SectionHeading(title: 'Description',showActionButton: false,),
                  const SizedBox(height: MySize.spaceBtwItems,),
                  const ReadMoreText("A product description is a piece of marketing copy that explains a product's features and benefits, and why it's worth buying. It's often found on product packaging, in catalogs, and on websites. ",
                   trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),

                  ),
                  ///Reviewe
                  SizedBox(height: MySize.spaceBtwItems/2,),
                  const Divider(),
                  const SizedBox(height: MySize.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews(199)',showActionButton: false,),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3,size: 18), onPressed: ()=>Get.to(()=>const ProductReview()), ),
                    ],
                  ),

                  const SizedBox(height: MySize.spaceBtwSection,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

