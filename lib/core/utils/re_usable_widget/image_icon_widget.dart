import 'package:flutter/material.dart';
import '../colors/color.dart';
class ImageIconWidget extends StatelessWidget {
  const ImageIconWidget({super.key,
  required this.isFavorite,required this.onFavoriteClicked
  });
 // final IconData icon;
  final bool isFavorite;
  final void Function() onFavoriteClicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavoriteClicked,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.whiteColor
        ),
        child: Icon(isFavorite?Icons.favorite:Icons.favorite_border),
      ),
    );
  }
}
