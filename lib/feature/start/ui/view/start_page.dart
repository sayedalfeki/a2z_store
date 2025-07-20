import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/constants/strings.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/start/ui/view/start_bottom_navigation.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_state.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPage extends StatelessWidget {
   StartPage({super.key});
   StartViewModel startViewModel=StartViewModel();
   List<Widget> pages=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<StartViewModel,StartState>(
        bloc: startViewModel,
        listener: (context, state) {

        },
        builder:(context, state) =>  Scaffold(
          appBar: AppBar(
            title:   Text(AppStrings.appSlogan,
              style: AppStyle.sloganStyle,),
          ),
          body:Padding(
            padding:EdgeInsets.all(8.0.w),
            child: Column(
              children: [
                Visibility(
                  visible: startViewModel.selectedIndex<3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: TextFormField(
                            decoration: InputDecoration(
                                hintText:AppStrings.searchHintText,
                                prefixIcon: Icon(Icons.search,
                                  size: 24.w,
                                )
                            ),
                          )),
                          IconButton(onPressed: () {

                          }, icon: Icon(Icons.shopping_cart_outlined,
                            color:AppColor.mainColor ,size:30.w,))
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ) ,
          bottomNavigationBar:StartBottomNavigation(
            initialIndex: startViewModel.selectedIndex,
            onItemTapped: startViewModel.changeSelectedIndex,
          )
        ),
      ),
    );
  }
}
