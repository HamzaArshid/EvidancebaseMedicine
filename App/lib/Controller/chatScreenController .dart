import 'package:anjumali/constanst.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class ApiController extends GetxController {
  List responseList = <String>[].obs;
  List senddata = <String>[].obs;
  RxBool isloading = false.obs;
  RxBool isPasswordVisible = false.obs;
  final textEditingController = TextEditingController();
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void sendRequest(String requestData) async {
    try {
      isloading.value = true;
      // Make your API request here and get the response text
      var apiResponse = await http.post(
        Uri.parse("http://localhost:5000/predict"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'seed_text': requestData}),
      );
      if (apiResponse.statusCode == 200) {
        responseList.add(apiResponse.body);
        senddata.add(textEditingController.text);
        textEditingController.clear();
        print(responseList.toString());
        isloading.value = false;
      } else {
        isloading.value = false;

        print('Error: ${apiResponse.statusCode}');
//
      }
    } catch (error) {
      isloading.value = false;

      print(error.toString());
    }
  }

  void deleteResponse() {
    responseList.clear();
    isloading.value = false;
    //senddata.clear();
  }
}
