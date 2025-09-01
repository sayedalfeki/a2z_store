import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/feature/sub_category/domain/sub_category_entity.dart';
import 'package:a_to_z_store/feature/sub_category/ui/view_model/sub_category_state.dart';
import 'package:a_to_z_store/feature/sub_category/ui/view_model/sub_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/images/images.dart';
import '../../../../core/utils/re_usable_widget/custome_container.dart';
class SubCategoryWidget extends StatelessWidget {
   SubCategoryWidget({super.key,required this.categoryId});
final String categoryId;
final SubCategoryViewModel subCategoryViewModel=getIt<SubCategoryViewModel>();
 List<SubCategoryDataEntity> subCategories=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubCategoryViewModel,SubCategoryState>(
      bloc:subCategoryViewModel..getSubCategories(categoryId) ,
      listener: (context, state) {
        if(state is SubCategorySuccessState)
        {
          subCategories=state.subCategories;
        }
      },
      builder:(context, state) =>subCategories.isNotEmpty?  GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,
        childAspectRatio: 2/4
        ),
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomContainer(
                borderColor: Colors.transparent,
                //height:100.h,
                  padding: 0,
                  child: Image.asset(AppImages.ad2Image,fit: BoxFit.cover,)),
              Text(subCategories[index].name??'')
            ],
          );
        },):
      state is SubCategoryLoadingState?
      LoadingWidget():
          state is SubCategoryErrorState?
      AppErrorWidget(error: state.errorMessage,
    onPressed: () {
      subCategoryViewModel.getSubCategories(categoryId);
    },
    ):Container(child: Text('no subcategories'),)
      ,
    );
  }
}
