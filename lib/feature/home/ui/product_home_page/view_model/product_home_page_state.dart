abstract class ProductHomePageState{}
 class ProductHomePageInitState extends ProductHomePageState{}
 class ProductHomePageChangeCategoryState extends ProductHomePageState{
  final String categoryName;

  ProductHomePageChangeCategoryState({required this.categoryName});
 }
