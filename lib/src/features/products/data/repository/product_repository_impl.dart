import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:kpms_project/src/core/helpers/network_helper.dart';
import 'package:kpms_project/src/features/products/data/models/product_model.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final NetworkHelper _networkHelper = Get.find<NetworkHelper>();

  @override
  Future<Either<Exception, List<ProductModel>>> loadProducts() async {
    try {
      var result = await _networkHelper.sendGetRequest(route: "products");
      List<ProductModel> products = result["products"]
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return Right(products);
    } catch (ex) {
      return Left(ex as Exception);
    }
  }
}
