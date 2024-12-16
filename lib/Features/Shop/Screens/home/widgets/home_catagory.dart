import 'package:studio_projects/Common/Widgets/image_text_widget/verticalImageText.dart';
import 'package:studio_projects/Features/Shop/Screens/sub_category/sub_categories.dart';
import 'package:studio_projects/Utiles/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class homeCatagory extends StatelessWidget {
  const homeCatagory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return verticalImageText(
            image: ImageStrings.sportIcon,
            title: 'Shoes',
            onTap: ()=>Get.to(()=>const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
