
import 'package:flutter/material.dart';
import '../../../../core/utils/colors/color.dart';
import '../../domain/category.dart';
import 'category_widget_item.dart';
class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key,required this.categories,
    required this.onCategoryItemTap,required this.selectedIndex});
final List<CategoryDataEntity> categories;
final void Function(int) onCategoryItemTap;
final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return  Container(
      // padding: EdgeInsets.only(top: 4),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.mainColor),
            left:BorderSide(color: AppColor.mainColor),
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
          color: AppColor.categoryContainerColor
      ),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
             onTap:
            () {
               onCategoryItemTap(index);
            },
            child: CategoryWidgetItem(selected:index==selectedIndex,
              dataEntity: categories[index],
            ),
          );
        },),
    );
  }
}
