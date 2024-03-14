import 'package:get/get.dart';

class DataController extends GetxController {
  final Rx<dynamic> data = Rx<dynamic>(null);

  void updateData(dynamic newData) {
    data.value = newData;
  }
}
