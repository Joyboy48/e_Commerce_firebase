import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/products/cart/add_remove_button.dart';
import 'package:studio_projects/Common/Widgets/products/cart/cart_item.dart';
import 'package:studio_projects/Common/Widgets/texts/product_price_text.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'My Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySize.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
            itemBuilder: (_, index) => const Column(
                  children: [
                    cartItem(),
                    SizedBox(height: MySize.spaceBtwItems,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ///extra space
                            SizedBox(width: 60,),
                            ///add and remove button
                            productQuantityWithAddRemove(),
                          ],
                        ),

                        productPriceText(price: '2000')

                      ],
                    )
                  ],
                ),
            separatorBuilder: (_, __) => const SizedBox(
                  height: MySize.spaceBtwSection,
                ),
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySize.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: const Text('Checkout ₹2000')),
      ),
    );
  }
}



