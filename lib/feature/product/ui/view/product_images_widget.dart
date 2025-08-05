import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/image_icon_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/re_usable_widget/custome_container.dart';
class ProductImagesWidget extends StatelessWidget {
  const ProductImagesWidget({super.key,required this.images,
    required this.isFavorite,required this.onFavoriteClicked});
final List<String> images;
final bool isFavorite;
final void Function() onFavoriteClicked;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image:DecorationImage(image:NetworkImage(images[index]),
              fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.mainColor)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:images.map(
                (e) {
                  return CustomContainer(
                    width:images.indexOf(e)==index?30:7,
                    height:7 ,
                    color: images.indexOf(e)==index?AppColor.mainColor:AppColor.whiteColor,
                    radius: 30,
                  );
                },
              ).toList(),
            ),
          );
        },),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageIconWidget(
              isFavorite: isFavorite,
              onFavoriteClicked: onFavoriteClicked,
          ),
        )
      ],
    );
  }
}
