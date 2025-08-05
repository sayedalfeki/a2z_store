import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/images/images.dart';
import 'ad_state.dart';
class AdViewModel extends Cubit<AdState>
{
  AdViewModel():super(AdInitState())
  {

  }
  int pageIndex=0;
  PageController pageController=PageController(
    initialPage:0,
    keepPage: false,
  );
  List<String> images=[AppImages.ad1Image,AppImages.ad2Image,
    AppImages.ad3Image];
  move()async
  {
    pageIndex++;
    if(pageController.hasClients) {

      await pageController.animateToPage(pageIndex % images.length,
          duration: Duration(seconds: 1),
          curve: Curves.linear);
    }
    await Future.delayed(Duration(seconds: 30));

    emit(AdChangeIndexState());

  }

}