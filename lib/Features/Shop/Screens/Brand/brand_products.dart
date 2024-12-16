import 'package:studio_projects/Common/Widgets/Brands/brand_Card.dart';
import 'package:studio_projects/Common/Widgets/appBar/appBar.dart';
import 'package:studio_projects/Common/Widgets/products/sortable/sortable_product.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Nike'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          children: [
            ///Brand Detail
            BrandCard(showBorder: true),
            SizedBox(height: MySize.spaceBtwSection,),
            sortabeProduct(),
          ],
        ),
        ),
      ),
    );
  }
}
