import 'package:anjumali/Controller/Datacontorller.dart';
import 'package:anjumali/Controller/chatScreenController%20.dart';
import 'package:anjumali/FirebaseConstant/authController.dart';
import 'package:anjumali/constanst.dart';
import 'package:anjumali/main.dart';
import 'package:anjumali/screens/editProfile.dart';

var controller = Get.put(AuthController());
var apicontroller = Get.put(ApiController());

var datacontroler = Get.put(DataController());
List leftScreenList = [
  listButton(Icons.edit, "Edit Profile", () {
    dynamic data = datacontroler.data.value;
    Get.to(() => EditProfileScreen(
          data: data,
        ));
  }),
  listButton(Icons.delete, 'Clear Screen', () {
    apicontroller.deleteResponse();
  }),
  listButton(Icons.logout, "Log Out", () {
    controller.SignOut();
    Get.to(() => WellComeScreen());
  }),
];
