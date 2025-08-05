import 'package:a_to_z_store/core/di/di.dart';
import 'package:a_to_z_store/core/utils/colors/color.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/custome_container.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/error_widget.dart';
import 'package:a_to_z_store/core/utils/re_usable_widget/loading_widget.dart';
import 'package:a_to_z_store/core/utils/styles/styles.dart';
import 'package:a_to_z_store/feature/product/ui/view/product_images_widget.dart';
import 'package:a_to_z_store/feature/product/ui/view/product_info_container.dart';
import 'package:a_to_z_store/feature/product/ui/view_model/single_product_state.dart';
import 'package:a_to_z_store/feature/product/ui/view_model/single_product_view_model.dart';
import 'package:a_to_z_store/feature/token_view_model.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_state.dart';
import 'package:a_to_z_store/feature/wish_list/ui/view_model/wish_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../wish_list/domain/wish_list_entity.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  int sizeIndex = 2;
  int colorIndex = 2;
  int counter = 1;
  SingleProductViewModel singleProductViewModel =
      getIt<SingleProductViewModel>();
  List<WishListDataEntity> wishes=[];
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context)!.settings.arguments as String;
    TokenViewModel tokenViewModel=BlocProvider.of<TokenViewModel>(context);
    WishListViewModel wishViewModel=BlocProvider.of<WishListViewModel>(context);
    //print(productId);
    return BlocConsumer(
      bloc: wishViewModel..getWishList(token: tokenViewModel.token??''),
      listener: (context, state) {
        if(state is WishListSuccessState)
        {
          wishes=state.wishListEntity??[];
        }
        if(state is WishListAddingSuccessState)
        {
          wishViewModel.getWishList(token: tokenViewModel.token??'');
        }
      },
      builder:(context, state) =>
          state is WishListErrorState?
        AppErrorWidget(error: state.errorMessage,
    onPressed: () {
      wishViewModel.getWishList(token: tokenViewModel.token??'');
    },
    ): BlocConsumer(
        bloc: singleProductViewModel..getProduct(productId),
        listener: (context, state) {},
        builder:
            (context, state) => Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                title: Text('product details'),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    state is SingleProductLoadingState
                        ? LoadingWidget()
                        : state is SingleProductErrorState
                        ? AppErrorWidget(
                          error: state.errorMessage,
                          onPressed: () {},
                        )
                        : state is SingleProductSuccessState
                        ? Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ProductImagesWidget(
                                images: state.productDataDto?.data?.images ?? [],
                                isFavorite:wishViewModel.isFavorite(productId,
                                    wishes),
                                onFavoriteClicked: () {
                                  print('on favorite clicked');
                                  !wishViewModel.isFavorite(productId,
                                      wishes)?
                                      wishViewModel.addToWishList(token:tokenViewModel.token??'',
                                          productId: productId):
                                      wishViewModel.removeFromWishList(token: tokenViewModel.token??'',
                                          productId: productId);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    nameWidget(
                                      state.productDataDto?.data?.title ?? '',
                                      state.productDataDto?.data?.price ?? 0,
                                    ),
                                    rateWidget(
                                      state.productDataDto?.data?.sold ?? 0,
                                      state
                                              .productDataDto
                                              ?.data
                                              ?.ratingsAverage ??
                                          0,
                                      state
                                              .productDataDto
                                              ?.data
                                              ?.ratingsQuantity ??
                                          0,
                                    ),
                                    descriptionWidget(
                                      state.productDataDto?.data?.description ??
                                          '',
                                    ),
                                    sizesWidget(),
                                    colorsWidget(),
                                    addToCartWidget(
                                      state.productDataDto?.data?.price ?? 0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        : Container(),
              ),
            ),
      ),
    );
  }

  nameWidget(String title, int price) {
    return ProductInfoContainer(
      title: '',
      items: [Text(title), Spacer(), Text('EGP $price')],
    );
  }

  counterWidget() {
    return CustomContainer(
      margin: 0,
      height: 50,
      radius: 50,
      color: AppColor.mainColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              counter--;
              setState(() {});
            },
            child: Container(
              // alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.whiteColor, width: 2),
                borderRadius: BorderRadius.circular(30),
                //color: AppColor.whiteColor
              ),
              child: Transform.translate(
                offset: Offset(0, -8),
                child: Icon(Icons.minimize_rounded, color: AppColor.whiteColor),
              ),
            ),
          ),
          Spacer(),
          Text('$counter', style: AppStyle.whiteNormal15),
          Spacer(),
          GestureDetector(
            onTap: () {
              counter++;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.whiteColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(Icons.add, color: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  rateWidget(int sold, num rate, int totalRate) {
    return ProductInfoContainer(
      title: '',
      items: [
        Expanded(
          child: CustomContainer(
            margin: 0,
            alignment: Alignment.center,
            child: Text('$sold sold'),
          ),
        ),
        Expanded(
          child: CustomContainer(
            borderColor: AppColor.transparentColor,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star_rate, color: AppColor.appYellowColor),
                Text('$rate ($totalRate)'),
              ],
            ),
          ),
        ),

        Expanded(child: counterWidget()),
      ],
    );
  }

  descriptionWidget(String description) {
    return ProductInfoContainer(
      title: 'Description',
      items: [Expanded(child: Text(description))],
    );
  }

  sizesWidget() {
    List<int> sizes = [38, 39, 40, 41, 42];
    return ProductInfoContainer(
      title: 'size',
      items:
          sizes.map((e) {
            return GestureDetector(
              onTap: () {
                sizeIndex = sizes.indexOf(e);
                setState(() {});
              },
              child: CustomContainer(
                borderColor: AppColor.transparentColor,
                color:
                    sizes.indexOf(e) == sizeIndex
                        ? AppColor.mainColor
                        : AppColor.transparentColor,
                radius: 50,
                child: Text(
                  '$e',
                  style:
                      sizes.indexOf(e) == sizeIndex
                          ? AppStyle.whiteNormal15
                          : AppStyle.blueNormal14,
                ),
              ),
            );
          }).toList(),
    );
  }

  colorsWidget() {
    List<Color> colors = [
      AppColor.blackColor,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
    ];
    return ProductInfoContainer(
      title: 'color',
      items:
          colors.map((e) {
            return GestureDetector(
              onTap: () {
                colorIndex = colors.indexOf(e);
                setState(() {});
              },
              child: CustomContainer(
                borderColor: AppColor.transparentColor,
                color: e,
                radius: 50,
                child: Icon(
                  Icons.check,
                  color:
                      colors.indexOf(e) == colorIndex
                          ? AppColor.whiteColor
                          : AppColor.transparentColor,
                ),
              ),
            );
          }).toList(),
    );
  }

  addToCartWidget(int price) {
    return ProductInfoContainer(
      title: '',
      items: [
        Expanded(
          child: Column(children: [Text('Total Price'), Text('EGP $price')]),
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            color: AppColor.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_cart_outlined, color: AppColor.whiteColor),
                Text('Add to cart', style: AppStyle.whiteNormal15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
