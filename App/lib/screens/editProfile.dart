import 'package:anjumali/Controller/profileScreenController.dart';
import 'package:anjumali/constanst.dart';
import 'package:anjumali/screens/mainScreen.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  EditProfileScreen({super.key, required this.data});
  var controller = Get.put(editprofilecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
                onPressed: () {
                  Get.to(() => MyApp());
                },
                icon: Icon(Icons.arrow_back)),
            600.widthBox,
            "Evidence Base System".text.bold.maxFontSize(80).make()
          ],
        ),
        Padding(
          padding: EdgeInsets.all(50),
          child: Obx(
            () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFields(
                      secure: false,
                      hint: "Type Name",
                      label: "Name",
                      Textcontroller: controller.nameController),
                  10.heightBox,
                  textFields(
                    secure: !controller.isPasswordVisible.value,
                    IconButton: IconButton(
                      icon: Icon(controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                    ),
                    hint: "OldPassword",
                    label: "Old Password",
                    Textcontroller: controller.oldPassController,
                  ),
                  10.heightBox,
                  textFields(
                    secure: !controller.isNewPasswordVisible.value,
                    IconButton: IconButton(
                      icon: Icon(controller.isNewPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller.toggleNewPasswordVisibility();
                      },
                    ),
                    hint: "New Password",
                    label: "New Password",
                    Textcontroller: controller.newPassController,
                  ),
                  10.heightBox,
                  controller.isloading.value
                      ? CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            controller.isloading(true);
                            if (data['password'] ==
                                controller.oldPassController.text) {
                              await controller.changeAuthPassword(
                                  email: data["email"],
                                  password: controller
                                      .oldPassController.text, //old Password
                                  newpassowrd:
                                      controller.newPassController.text);
                              //old password change ho jy ga newpaswwrod sy database k andr
                              await controller.updateProfile(
                                  name: controller.nameController.text,
                                  password: controller.newPassController.text);
                              VxToast.show(
                                  bgColor: Colors.black,
                                  textColor: Colors.white,
                                  position: VxToastPosition.bottom,
                                  context,
                                  msg: "Updated");
                              controller.isloading(false);
                            } else {
                              VxToast.show(context, msg: "Wrong Old Password");
                            }
                          },
                          child: Text("Update Profile"))
                ],
              )
                  .box
                  .height(500)
                  .width(400)
                  .white
                  .shadow
                  .padding(EdgeInsets.all(50))
                  .rounded
                  .make(),
            ),
          ),
        ),
      ]),
    ));
  }
}
