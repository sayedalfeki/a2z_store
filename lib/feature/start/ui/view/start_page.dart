import 'package:a_to_z_store/config/routes/routes.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/constants/strings.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/account/view/account_page.dart';
import 'package:a_to_z_store/feature/categories/ui/view/category_page.dart';
import 'package:a_to_z_store/feature/products/ui/view/products_page.dart';
import 'package:a_to_z_store/feature/home/ui/product_home_page/view/product_home_page.dart';
import 'package:a_to_z_store/feature/start/ui/view/start_bottom_navigation.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_state.dart';
import 'package:a_to_z_store/feature/start/ui/view_model/start_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view/wish_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/ui/view/product_page.dart';
class StartPage extends StatelessWidget {
   StartPage({super.key});
   //StartViewModel startViewModel=StartViewModel();
   List<Widget> pages=[ProductHomePage(),CategoryPage(),WishListPage(),AccountPage()];
   List<String> pagesRoute=[AppRoutes.homeRoute,AppRoutes.categoriesRoute,
     AppRoutes.wishRoute,AppRoutes.accountRoute];

   List<Page> newpages=[NewPage(ProductHomePage()),
     NewPage(CategoryPage()),
     NewPage(WishListPage()),
     NewPage(AccountPage())];

   //Widget? page;
  @override
  Widget build(BuildContext context) {
    StartViewModel startViewModel=BlocProvider.of<StartViewModel>(context);
     //page=pages[startViewModel.selectedIndex];
    return SafeArea(
      child: BlocConsumer<StartViewModel,StartState>(
       // bloc: startViewModel,
        listener: (context, state) {

        },
        builder:(context, state) =>  WillPopScope(
          onWillPop: () async{
            if (startViewModel.navigatorKey.currentState?.canPop() ?? false) {
              startViewModel.navigatorKey.currentState?.pop();
              return false; // منع الرجوع للخلف في الـ Navigator الخارجي
            }
            return true; // يسمح بالخروج من التطبيق
          },
          child: Scaffold(
            backgroundColor: AppColor.whiteColor,
            appBar: AppBar(
              //backgroundColor: Colors.red,
              toolbarHeight:50.h,
              title:   Text(AppStrings.appSlogan,
                style: AppStyle.sloganStyle,),
            ),
            body:Padding(
              padding:EdgeInsets.only(left: 8,right: 8),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Visibility(
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
                  ),
                  //SizedBox(height: 10,),
                //  pages[startViewModel.selectedIndex]
              Expanded(child:
                  Navigator(
                    key: startViewModel.navigatorKey,
                    initialRoute: pagesRoute[startViewModel.selectedIndex],// خطوة مهمة
                    onGenerateRoute: (RouteSettings settings) {
                      print('selected index : ${startViewModel.selectedIndex}');
                      late Widget page;
                       if(settings.name==AppRoutes.homeRoute)
                       {
                         page=pages[0];
                       }
                       else if(settings.name==AppRoutes.categoriesRoute){
                         page=pages[1];

                       }
                       else if(settings.name==AppRoutes.wishRoute){
                         page=pages[2];

                       }
                       else if(settings.name==AppRoutes.accountRoute){
                         page=pages[3];

                       }
                      else if (settings.name ==AppRoutes.productsRoute) {
                        page = ProductsPage(); // أي صفحة تانية عايز تروح ليها
                      }
                      else {

                        page = ProductPage(); // أي صفحة تانية عايز تروح ليها
                      }

                       return
                         //newpages[startViewModel.selectedIndex];
                      MaterialPageRoute(
                        builder: (context) =>page,
                        settings: settings,
                      );
                    },
                   // pages: newpages,
                  ),
                  )
                ],
              ),
            ) ,
            bottomNavigationBar:StartBottomNavigation(
              initialIndex: startViewModel.selectedIndex,
              onItemTapped: startViewModel.changeSelectedIndex,
            )
          ),
        ),
      ),
    );
  }
}
class NewPage extends Page
{
  Widget child;
  NewPage(this.child);
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(builder:(context) {
      return child;
    },);
  }

}
