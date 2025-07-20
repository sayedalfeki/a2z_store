
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StartBottomNavigation extends StatelessWidget {
  StartBottomNavigation({super.key,this.initialIndex=0,
    this.onItemTapped
  });
  int initialIndex;
  void Function(int)? onItemTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r)
        ),
        color: AppColor.mainColor
      ),
       child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
              homeBottomNavigationBarItem(icon: Icons.home,index: 0),
              homeBottomNavigationBarItem(icon: Icons.grid_view,index: 1),
              homeBottomNavigationBarItem(icon: Icons.favorite_border,index: 2),
              homeBottomNavigationBarItem(icon: Icons.person,index: 3,)
         ],
       )

    );
  }

  homeBottomNavigationBarItem({required IconData icon,
    required int index})
  {
    return GestureDetector(
      onTap: () {
        if(onItemTapped!=null)
        {
          onItemTapped!(index);
        }
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color:initialIndex==index? AppColor.whiteColor:AppColor.transparentColor
        ),
        child: Icon(icon,color:initialIndex==index?AppColor.mainColor
            :AppColor.whiteColor,),
      ),
    );

    //   BottomNavigationBarItem(icon:Icon(icon),
    // label: '',
    //     backgroundColor: AppColor.whiteColor
    // );
  }
}
