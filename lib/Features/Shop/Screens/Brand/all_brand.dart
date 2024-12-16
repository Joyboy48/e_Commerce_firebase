import 'package:studio_projects/Common/Widgets/Brands/brand_Card.dart';
import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/layouts/grid_layout.dart';
import 'package:studio_projects/Common/Widgets/products/sortable/sortable_product.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Features/Shop/Screens/Brand/brand_products.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: Text('Brands'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          children: [
            const SectionHeading(title:'Brands',showActionButton: false,),
            const SizedBox(height: MySize.spaceBtwItems,),

            ///Brands
            Gridlayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index)=> BrandCard(showBorder: true,onTap: ()=>Get.to(()=>BrandProducts()),))
          ],
        ),
        ),
      ),
    );
  }
}
