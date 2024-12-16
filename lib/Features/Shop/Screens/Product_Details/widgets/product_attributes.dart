import 'package:studio_projects/Common/Widgets/chips/choice_chip.dart';
import 'package:studio_projects/Common/Widgets/custom_shapes/container/rounded_container.dart';
import 'package:studio_projects/Common/Widgets/texts/product_price_text.dart';
import 'package:studio_projects/Common/Widgets/texts/product_title_text.dart';
import 'package:studio_projects/Common/Widgets/texts/section_heading.dart';
import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///Selecting Attributes and Description
        RoundedContainer(
          padding: const EdgeInsets.all(MySize.md),
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
          child: Column(
            children: [
              ///Title price stock status
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation',
                    showActionButton: false,


                  ),
                  const SizedBox(
                    width: MySize.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price : ',
                            //smallSize: true,
                          ),
                          const SizedBox(
                            width: MySize.spaceBtwItems,
                          ),

                          ///Actual price
                          Text(
                            '₹3000',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: MySize.spaceBtwItems,
                          ),

                          ///sale price
                          const productPriceText(price: '2250',)
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            //smallSize: true,
                          ),
                          Text(
                            ' In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

              ///Variation Description
              const ProductTitleText(
                title:
                    'This is the Description of the productd and it can be maxed upto 4 line',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: MySize.spaceBtwItems,
        ),

        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors',showActionButton: false,),
            const SizedBox(
              height: MySize.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(text: 'Green',selected: true,onSelected: (value){},),
                MyChoiceChip(text: 'Blue',selected: false,onSelected: (value){},),
                MyChoiceChip(text: 'Yellow',selected: false,onSelected: (value){},),
                MyChoiceChip(text: 'Red',selected: false,onSelected: (value){},),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size',showActionButton: false,),
            const SizedBox(
              height: MySize.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                MyChoiceChip(text: 'S',selected: true,onSelected: (value){},),
                MyChoiceChip(text: 'M',selected: false,onSelected: (value){},),
                MyChoiceChip(text: 'L',selected: false,onSelected: (value){},),
                MyChoiceChip(text: 'XL',selected: false,onSelected: (value){},),
              ],
            )
          ],
        ),
      ],
    );
  }
}

