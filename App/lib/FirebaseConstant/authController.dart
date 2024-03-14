import 'package:anjumali/FirebaseConstant/FirebaseCredentials.dart';
import 'package:anjumali/constanst.dart';

class AuthController extends GetxController {
  var isloading = false.obs;
  RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<UserCredential?> LogInMethod({email, password, context}) async {
    UserCredential? usercredential;
    try {
      isloading(true);
      usercredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString(),
      );
    }
    return usercredential;
    isloading(false);
  }

//signUp Methood
  Future<UserCredential?> SignUp({email, password, context}) async {
    UserCredential? usercredential;
    try {
      isloading(true);
      usercredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return usercredential;
    isloading(false);
  }

  storUserData({email, password, name}) async {
    isloading(true);
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      "name": name,
      "email": email,
      "password": password,
      'id': currentUser!.uid,
    });
    isloading(false);
  }

  void SignOut() {
    try {
      
      auth.signOut();
      isloading(false);
    } catch (e) {
      
    }
  }
}
