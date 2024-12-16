
import 'package:studio_projects/Common/Widgets/custom_shapes/container/primary_headerContainer.dart';
import 'package:studio_projects/Common/Widgets/custom_shapes/container/search_container.dart';
import 'package:studio_projects/Common/Widgets/layouts/grid_layout.dart';
import 'package:studio_projects/Common/Widgets/products/product_cards/product_card_vertical.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Features/Shop/Screens/All_product/all_product.dart';
import 'package:studio_projects/Features/Shop/Screens/home/widgets/homeAppbar.dart';
import 'package:studio_projects/Features/Shop/Screens/home/widgets/home_catagory.dart';
import 'package:studio_projects/Features/Shop/Screens/home/widgets/promo_slider.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header ---------------
            const primaryHeaderContainer(
              child: Column(
                children: [
                  //appbar-----------------
                  homeAppbar(),
                  SizedBox(
                    height: MySize.spaceBtwSection,
                  ),
                  //search bar--------------------
                  searchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: MySize.spaceBtwSection,
                  ),
                  //catagorys----------------
                  Padding(
                    padding: EdgeInsets.only(left: MySize.defaultSpace),
                    child: Column(
                      children: [
                        ///heading------
                        SectionHeading(
                          title: 'Popular Catagory',
                          showActionButton: false,
                          textColor: MyColors.white,
                        ),
                        SizedBox(
                          height: MySize.spaceBtwItems,
                        ),
                        //cetegory-----------
                        homeCatagory()
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.spaceBtwSection,)
                ],
              ),
            ),
            //body--------------
            Padding(
                padding: const EdgeInsets.all(MySize.defaultSpace),
                child: Column(
                  children: [
                    const promoSlider(
                      banners: [
                        ImageStrings.banner1,
                        ImageStrings.banner2,
                        ImageStrings.banner3,
                        ImageStrings.banner4,
                        ImageStrings.banner5,
                        ImageStrings.banner6,
                        ImageStrings.banner7,
                        ImageStrings.banner8,
                        ImageStrings.banner9,
                      ],
                    ),
                    const SizedBox(height: MySize.spaceBtwItems/2,),
                    SectionHeading(title: "Popular Products",onPressed: ()=>Get.to(()=>const AllProductScreen()),),
                    const SizedBox(
                      height: MySize.spaceBtwItems,
                    ),
                    Gridlayout(itemCount: 4, itemBuilder: (_ , int )=>const ProductCardVertical(),),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
