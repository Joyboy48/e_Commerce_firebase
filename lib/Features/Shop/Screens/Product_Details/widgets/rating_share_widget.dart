import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingandShare extends StatelessWidget {
  const RatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Rating
        Row(
          children: [
            const Icon(Iconsax.star5,color: Colors.amber,size: 24,),
            const SizedBox(width: MySize.spaceBtwItems,),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: '5.0',style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(text: '(199)')
                    ]
                )
            )

          ],
        ),
        ///ShareButton
        IconButton(onPressed: (){} , icon: const Icon(Icons.share,size: MySize.iconMd,))
      ],
    );
  }
}

