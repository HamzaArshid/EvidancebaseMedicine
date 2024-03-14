import "package:anjumali/FirebaseConstant/FirebaseCredentials.dart";
import "package:anjumali/screens/SignUp.dart";
import "package:anjumali/screens/convesationScreen.dart";
import "package:anjumali/screens/loginScreen.dart";
import "package:anjumali/screens/mainScreen.dart";
import "package:flutter/foundation.dart";
import "constanst.dart";
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDMcog1RL5GfMPaj40CG2yU8ok99OTYa4I",
            appId: "1:1018418039001:web:7cbef4d526b7eaca6bd6c8",
            messagingSenderId: "1018418039001",
            projectId: "ebasesystem-a1739"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(Random());

  //  const WellComeScreen());
}

class Random extends StatefulWidget {
  const Random({super.key});

  @override
  State<Random> createState() => _RandomState();
}

class _RandomState extends State<Random> {
  ChangeScreen() {
    Future.delayed(Duration(seconds: 3));
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) //no user login
      {
        Get.to(() => loginScreen());
      } else {
        Get.to(() => MyApp());
      }
    });
  }

  @override
  void initState() {
    ChangeScreen();
    super.initState();
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: loginScreen());
  }
}

class WellComeScreen extends StatefulWidget {
  const WellComeScreen({super.key});

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wellComeMessage.text.size(23).make(),
              10.heightBox,
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttons(
                      width: 100,
                      title: login,
                      onPress: () {
                        Get.to(() => loginScreen());
                      }),
                  5.widthBox,
                  Buttons(
                      width: 100,
                      title: signUp,
                      onPress: () {
                        Get.to(() => SignUp());
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
