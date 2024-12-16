import 'package:studio_projects/Utiles/Helpers/helper_functions.dart';
import 'package:studio_projects/Utiles/constants/colors.dart';
import 'package:studio_projects/Utiles/constants/size.dart';
import 'package:flutter/cupertino.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width =56,
    this.height =56,
    this.padding =MySize.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: HelperFunctions.isDarkMode(context)
            ? MyColors.black
            : MyColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage?NetworkImage(image):AssetImage(image) as ImageProvider,
          color: overlayColor
        ),
      ),
    );
  }
}

