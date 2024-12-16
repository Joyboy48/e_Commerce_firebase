import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/images/rounded_images.dart';
import 'package:studio_projects/Common/Widgets/products/product_cards/product_card_horizontal.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        showBackArrow: true,
        title: Text(
          'Sports',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            children: [
              ///Banner
               RoundedImage(
                imageUrl: ImageStrings.banner3,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: MySize.spaceBtwSection,
              ),

              ///sub category
              Column(
                children: [
                  ///heading
                  SectionHeading(
                    title: 'Sports shirt',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: MySize.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context,index)=>const SizedBox(width: MySize.spaceBtwItems,),
                    
                        itemBuilder: (context, index) => const ProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
