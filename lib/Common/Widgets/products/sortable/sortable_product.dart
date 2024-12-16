import 'package:studio_projects/Common/Widgets/layouts/grid_layout.dart';
import 'package:studio_projects/Common/Widgets/products/product_cards/product_card_vertical.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class sortabeProduct extends StatelessWidget {
  const sortabeProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Dropdown
        DropdownButtonFormField(
          items: [
            'Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popular']
              .map((option)=>DropdownMenuItem(
              value: option,
              child: Text(option))).toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(height:MySize.spaceBtwItems,),
        ///product
        Gridlayout(itemCount: 10, itemBuilder: (context,index)=>const ProductCardVertical())
      ],
    );
  }
}
