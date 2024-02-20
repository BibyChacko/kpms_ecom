import 'package:get/get.dart';
import 'package:kpms_project/src/core/helpers/network_helper.dart';
import 'package:kpms_project/src/features/products/presentation/controller/products_controller.dart';

import '../../features/authentication/presentation/controller/auth_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ProductsController());
    Get.put<NetworkHelper>(NetworkHelper(), permanent: true);
  }
}
