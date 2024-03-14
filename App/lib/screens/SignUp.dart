import 'package:anjumali/FirebaseConstant/authController.dart';
import 'package:anjumali/constanst.dart';
import 'package:anjumali/screens/loginScreen.dart';
import 'package:anjumali/screens/mainScreen.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  var controller = Get.put(AuthController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Obx(
            () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQQT5v2M7JTv41eS8m8O9by3UZOxGzLETrNA&usqp=CAU'),
                  //logo,
                  10.heightBox,
                  creataccount.text.size(23).make(),
                  10.heightBox,
                  textFields(
                      hint: "EnterName",
                      label: "Name",
                      secure: false,
                      Textcontroller: nameController),
                  10.heightBox,
                  textFields(
                      hint: emialhint,
                      label: email,
                      secure: false,
                      Textcontroller: emailController),
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
                      hint: passwordhint,
                      label: password,
                      Textcontroller: passwordController),
                  10.heightBox,
                  controller.isloading.value
                      ? CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : Buttons(
                          title: signUp,
                          onPress: () {
                            controller.isloading(true);
                            try {
                              controller.SignUp(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context)
                                  .then((value) => {
                                        controller.storUserData(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text)
                                      })
                                  .then((value) => {
                                        VxToast.show(
                                          context,
                                          msg:
                                              "Register Sucessfully".toString(),
                                          bgColor: Colors.black,
                                          textColor: Colors.white,
                                          position: VxToastPosition.bottom,
                                        ),
                                        Get.to(() => MyApp()),
                                      });
                            } catch (e) {
                              controller.SignOut();
                              VxToast.show(context, msg: e.toString());
                            }
                          },
                          width: double.infinity),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      aAccount.text.make(),
                      2.widthBox,
                      login.text.color(Colors.blue).make().box.make().onTap(() {
                        Get.to(() => loginScreen());
                      }),
                    ],
                  ),
                ],
              )
                  .box
                  .white
                  .height(500)
                  .width(400)
                  .shadow
                  .padding(EdgeInsets.only(left: 20, right: 20))
                  .rounded
                  .make(),
            ),
          ),
        ),
      ),
    );
  }
}
