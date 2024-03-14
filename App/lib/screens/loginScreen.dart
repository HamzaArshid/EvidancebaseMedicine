import 'package:anjumali/FirebaseConstant/authController.dart';
import 'package:anjumali/constanst.dart';

import 'package:anjumali/screens/SignUp.dart';
import 'package:anjumali/screens/mainScreen.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});

  @override
  var controller = Get.put(AuthController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(50),
            child: Obx(
              () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQQT5v2M7JTv41eS8m8O9by3UZOxGzLETrNA&usqp=CAU'),
                    //logo,
                    // wellComBack.text.size(23).make(),
                    10.heightBox,
                    textFields(
                        hint: emialhint,
                        label: email,
                        secure: false,
                        Textcontroller: emailController),
                    10.heightBox,
                    textFields(
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
                        secure: !controller.isPasswordVisible.value,
                        Textcontroller: passwordController),
                    10.heightBox,
                    controller.isloading.value
                        ? CircularProgressIndicator(
                            color: Colors.blue,
                          )
                        : Buttons(
                            width: double.infinity,
                            title: login,
                            onPress: () async {
                              controller.isloading(true);
                              await controller.LogInMethod(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context)
                                  .then((value) => {
                                        if (value != null)
                                          {
                                            VxToast.show(
                                              context,
                                              msg: "logIn Sucesssfull"
                                                  .toString(),
                                              bgColor: Colors.black,
                                              textColor: Colors.white,
                                              position: VxToastPosition.bottom,
                                            ),
                                            Get.offAll(() => MyApp())
                                          }
                                        else
                                          {
                                            controller.isloading(false),
                                          }
                                      });
                            }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        noAccount.text.make(),
                        2.widthBox,
                        signUp.text
                            .color(Colors.blue)
                            .make()
                            .box
                            .make()
                            .onTap(() {
                          Get.to(() => SignUp());
                        }),
                      ],
                    ),
                  ],
                )
                    .box
                    .height(500)
                    .width(400)
                    .white
                    .shadow
                    .padding(EdgeInsets.only(left: 20, right: 20))
                    .rounded
                    .make(),
              ),
            )),
      ),
    );
  }
}
