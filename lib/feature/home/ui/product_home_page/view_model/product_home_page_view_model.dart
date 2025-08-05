import 'package:a_to_z_store/feature/home/ui/product_home_page/view_model/product_home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductHomePageViewModel extends Cubit<ProductHomePageState>{
  ProductHomePageViewModel():super(ProductHomePageInitState());
  changeCategoryName(String categoryName)
  {
    emit(ProductHomePageChangeCategoryState(categoryName: categoryName));
  }
}