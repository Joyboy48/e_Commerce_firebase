import 'package:studio_projects/Common/Widgets/Brands/brand_Showcase.dart';
import 'package:studio_projects/Common/Widgets/layouts/grid_layout.dart';
import 'package:studio_projects/Common/Widgets/products/product_cards/product_card_vertical.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/cupertino.dart';

class CatagoryTab extends StatelessWidget {
  const CatagoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [
        Padding(padding: const EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          children: [
            ///Brands
            const BrandShowcase(images:[ImageStrings.bat1,ImageStrings.bat1,ImageStrings.bat1],),
            const BrandShowcase(images:[ImageStrings.bat1,ImageStrings.bat1,ImageStrings.bat1],),

            const SizedBox(height: MySize.spaceBtwItems,),
            ///Product
            SectionHeading(title: 'You Might Like',showActionButton: true,onPressed: (){}),
            const SizedBox(height: MySize.spaceBtwItems,),
      
            Gridlayout(itemCount: 4, itemBuilder: (_,index)=>const ProductCardVertical()),
            const SizedBox(height: MySize.spaceBtwSection ,)
      
          ],
        ),
      ),]
    );
  }
}
