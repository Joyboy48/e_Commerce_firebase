import 'package:studio_projects/Common/Widgets/Brands/brand_Card.dart';
import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/appBar/tabBar.dart';
import 'package:studio_projects/Common/Widgets/custom_shapes/container/search_container.dart';
import 'package:studio_projects/Common/Widgets/layouts/grid_layout.dart';
import 'package:studio_projects/Common/Widgets/products/cart/cart_menu_icon.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Features/Shop/Screens/Brand/all_brand.dart';
import 'package:studio_projects/Features/Shop/Screens/store/widget/catagory_tab.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: MyAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              cartCounterIcon(onPressed: () {}, iconColor: MyColors.black)
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: HelperFunctions.isDarkMode(context)
                        ? MyColors.black
                        : MyColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(MySize.defaultSpace),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ///Search bar
                          const SizedBox(
                            height: MySize.spaceBtwItems,
                          ),
                          const searchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(
                            height: MySize.spaceBtwItems,
                          ),

                          ///featured  brand
                          SectionHeading(
                            title: 'Featured Brands',
                            showActionButton: true,
                            onPressed: ()=>Get.to(()=>const AllBrandScreen()),
                          ),
                          const SizedBox(
                            height: MySize.spaceBtwItems / 1.5,
                          ),
                          Gridlayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const BrandCard(
                                  showBorder: false,
                                );
                              })
                        ],
                      ),
                    ),

                    ///tabs
                    bottom: const MyTabBar(tabs: [
                      Tab(
                        child: Text('Sports'),
                      ),
                      Tab(
                        child: Text('Furniture'),
                      ),
                      Tab(
                        child: Text('Electronics'),
                      ),
                      Tab(
                        child: Text('Clothes'),
                      ),
                      Tab(
                        child: Text('Cosmetics'),
                      ),
                    ])),
              ];
            },
            body: const TabBarView(children: [
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
              CatagoryTab(),
            ]),
          ),
        ));
  }
}

//
// import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
// import 'package:studio_projects/Common/Widgets/appBar/tabBar.dart';
// import 'package:studio_projects/Common/Widgets/custom_shapes/container/brand_Card.dart';
// import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
// import 'package:studio_projects/Common/Widgets/custom_shapes/container/search_container.dart';
// import 'package:studio_projects/Common/Widgets/icons/circular_icon.dart';
// import 'package:studio_projects/Common/Widgets/images/circular_images.dart';import 'package:studio_projects/Common/Widgets/layouts/grid_layout.dart';
// import 'package:studio_projects/Common/Widgets/products/cart/cart_menu_icon.dart';
// import 'package:studio_projects/Common/Widgets/texts/brand_title_text_with_verified_icon.dart';
// import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
// import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
// import 'package:studio_projects/Utiles/constants/colors.dart';
// import 'package:studio_projects/Utiles/constants/enums.dart';
// import 'package:studio_projects/Utiles/constants/image_strings.dart';
// import 'package:studio_projects/Utiles/constants/size.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Store extends StatelessWidget {
//   const Store({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: MyAppBar(
//           title: Text(
//             'Store',
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//           actions: [
//             cartCounterIcon(onPressed: () {}, iconColor: MyColors.white)
//           ],
//         ),
//         body: NestedScrollView(
//           headerSliverBuilder: (_, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 pinned: true,
//                 floating: true,
//                 backgroundColor: HelperFunctions.isDarkMode(context)
//                     ? MyColors.black
//                     : MyColors.white,
//                 expandedHeight: 440,
//                 flexibleSpace: Padding(
//                   padding: EdgeInsets.all(MySize.defaultSpace),
//                   child: ListView(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     children: [
//                       ///Search bar
//                       SizedBox(
//                         height: MySize.spaceBtwItems,
//                       ),
//                       searchContainer(
//                         text: 'Search in Store',
//                         showBorder: true,
//                         showBackground: false,
//                         padding: EdgeInsets.zero,
//                       ),
//                       SizedBox(
//                         height: MySize.spaceBtwItems,
//                       ),
//
//                       ///featured brand
//                       SectionHeading(
//                         title: 'Featured Brands',
//                         showActionButton: true,
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         height: MySize.spaceBtwItems / 1.5,
//                       ),
//                       Gridlayout(
//                           itemCount: 4,
//                           mainAxisExtent: 80,
//                           itemBuilder: (_, index) {
//                             return BrandCard(
//                               showBorder: false,
//                             );
//                           })
//                     ],
//                   ),
//                 ),
//
//                 ///tabs
//                 bottom: MyTabBar(tabs: [
//                   Tab(
//                     child: Text('Sports'),
//                   ),
//                   Tab(
//                     child: Text('Furniture'),
//                   ),
//                   Tab(
//                     child: Text('Electronics'),
//                   ),
//                   Tab(
//                     child: Text('Clothes'),
//                   ),
//                   Tab(
//                     child: Text('Cosmetics'),
//                   ),]),
//               ),
//             ];
//           },
//           body: TabBarView(children: [
//             // Content for Tab 1 (Sports)
//             Padding(
//               padding: EdgeInsets.all(MySize.defaultSpace),
//               child: Column(
//                 children: [
//                   ///Brands
//                   RoundedContainer(
//                     showBorder: true,
//                     borderColor: MyColors.darkGrey,
//                     backgroundColor: Colors.transparent,
//                     margin: EdgeInsets.only(bottom: MySize.spaceBtwItems),
//                     child: Column(
//                       children: [
//                         ///Brand with product count
//                         BrandCard(showBorder: true),
//
//                         ///Brand top3 product
//                       ],
//                     ),
//                   )
//
//                   ///Product
//                 ],
//               ),
//             ),
//             // Content for Tab 2 (Furniture)
//             Center(child: Text('Furniture Content')), // Example content
//             // Content for Tab 3 (Electronics)
//             Center(child: Text('Electronics Content')), // Example content
//             // Content for Tab 4 (Clothes)
//             Center(child: Text('Clothes Content')), // Example content
//             // Content for Tab 5 (Cosmetics)
//             Center(child: Text('Cosmetics Content')), // Example content
//           ]),
//         ),
//       ),
//     );
//   }
// }
