import 'package:flutter/cupertino.dart';

bool isLargeWidth(BuildContext context) {
  print(MediaQuery.sizeOf(context).height
      /MediaQuery.sizeOf(context).width);
  return MediaQuery.sizeOf(context).height
      /MediaQuery.sizeOf(context).width<2;
}
