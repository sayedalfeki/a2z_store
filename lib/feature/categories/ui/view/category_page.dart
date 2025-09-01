import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/images/images.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/categories/ui/view/category_image_widget.dart';

import 'package:a_to_z_store/feature/sub_category/ui/view/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/category.dart';
import '../view_model/category_state.dart';
import '../view_model/category_view_model.dart';
import 'category_widget.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final categoryViewModel=getIt<CategoryViewModel>();
  List<CategoryDataEntity> categories=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryViewModel,CategoryState>(
      bloc:categoryViewModel..getCategories() ,
      listener: (context, state) {
        if(state is CategorySuccessState)
        {
          categories=state.categories;
        }
      },
      builder:(context, state) =>  categories.isNotEmpty?
      Row(
       // crossAxisAlignment:CrossAxisAlignment.stretch ,
        children: [
          Expanded(
              flex: 2,
              child:
              CategoryWidget(
                categories:categories,
                selectedIndex:categoryViewModel.selectedIndex,
                onCategoryItemTap: (index) {
                     categoryViewModel.changeSelectedIndex(index);
                     },
              )
          // Container(
          //  // padding: EdgeInsets.only(top: 4),
          //   margin: EdgeInsets.all(5),
          //   decoration: BoxDecoration(
          //     border: Border(
          //       top: BorderSide(color: AppColor.mainColor),
          //       left:BorderSide(color: AppColor.mainColor),
          //     ),
          //     borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
          //     color: AppColor.categoryContainerColor
          //   ),
          //   child: ListView.builder(
          //     itemCount: categories.length,
          //     itemBuilder: (context, index) {
          //     return GestureDetector(
          //       onTap: () {
          //         categoryViewModel.changeSelectedIndex(index);
          //       },
          //       child: CategoryWidgetItem(selected:
          //       index==categoryViewModel.selectedIndex,
          //       dataEntity: categories[index],
          //       ),
          //     );
          //   },),
          // )
          ),
          //SizedBox(width: 5,),
          Expanded(
              flex:3,
              child: Column(
            children: [
              Expanded(child:CategoryImageWidget
                (categoryName:categories[categoryViewModel.selectedIndex].name??'' ,
                  imagePath:categories[categoryViewModel.selectedIndex].image??'')

             // Container(
             //    padding: EdgeInsets.all(8),
             //      decoration: BoxDecoration(
             //        image: DecorationImage(image:NetworkImage(
             //          categories[categoryViewModel.selectedIndex].image
             //              ??''
             //        ),
             //        fit: BoxFit.cover
             //        )
             //      ),
             //      child: Column(
             //        crossAxisAlignment: CrossAxisAlignment.stretch,
             //        mainAxisAlignment: MainAxisAlignment.center,
             //        children: [
             //          Expanded(
             //            child: Row(
             //              children: [
             //                Container(
             //                 // color: Colors.red,
             //                  width:66.w,
             //                  child: Expanded(
             //                    child: Text(
             //                    categories[categoryViewModel.selectedIndex].name??''
             //                    ,style: AppStyle.blueBold18.copyWith(
             //                      fontSize:20,
             //                      fontWeight: FontWeight.bold
             //                    ),),
             //                  ),
             //                ),
             //              ],
             //            ),
             //          ),
             //          Row(
             //            children: [
             //              CustomContainer(
             //                color: AppColor.mainColor,
             //                child: Text('shop now'),
             //              ),
             //            ],
             //          )
             //          //Image.asset(AppImages.ad1Image),
             //        ],
             //      ))


              ),
              Expanded(
                  flex: 3,
                   child:SubCategoryWidget(categoryId:
                   categories[categoryViewModel.selectedIndex].id??'')
                  // GridView.builder(
                  // gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
                  // itemBuilder: (context, index) {
                  //   return Container(
                  //     child: Image.asset(AppImages.ad2Image),
                  //   );
                  // },)
                  )
            ],
          ))
        ],
      ):
      state is CategoryLoadingState?
      LoadingWidget():
      state is CategoryErrorState?
      AppErrorWidget(error: state.errorMessage,
        onPressed: () {
          categoryViewModel.getCategories();
        },
      ):CustomContainer(
        child: Text('no categories founded'),
      ),
    );
  }
}
