import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpms_project/src/core/common/widgets/app_loader.dart';
import 'package:kpms_project/src/core/common/widgets/load_error_widget.dart';
import 'package:kpms_project/src/features/products/data/models/product_model.dart';
import 'package:kpms_project/src/features/products/presentation/controller/products_controller.dart';
import 'package:kpms_project/src/features/products/presentation/views/widgets/product_item_view.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);
  final productsController = Get.find<ProductsController>()..loadProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          switch (productsController.productState.value) {
            case ProductsState.initial:
              return const SizedBox();
            case ProductsState.loading:
              return const AppLoader(
                type: LoaderType.list,
              );
            case ProductsState.loaded:
              List<ProductModel> products = productsController.productList;
              return ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, pos) =>
                      ProductItemView(productModel: products[pos]));
            case ProductsState.error:
              return LoadErrorWidget(
                  title: "Oops! Error",
                  body: "Something went wrong loading the products",
                  onRetryPressed: () {
                    productsController.loadProducts();
                  });
          }
        }),
      )),
    );
  }
}
