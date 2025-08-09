import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custome_container.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key,required this.error,this.onPressed});
  final String error;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainer(
        height:150.h,
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Text(error))),
            SizedBox(height: 5,),
            Visibility(
                visible: onPressed!=null?true:false,
                child: ElevatedButton(onPressed: onPressed, child: Text('retry')))
          ],
        ),
      ),
    );
  }
}
