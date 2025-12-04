import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavController extends GetxController {
  final RxBool _fav = false.obs;
  bool get fav => _fav.value;
  set fav(bool val) => _fav.value = val;

}
