import 'package:anjumali/constanst.dart';

import '../FirebaseConstant/FirebaseCredentials.dart';

class editprofilecontroller extends GetxController {
  var oldPassController =
      TextEditingController(); //when user change password, for password confirmation ne need to add this text field, means that (old password)
  var nameController = TextEditingController();
  var newPassController = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isloading = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  updateProfile({name, password}) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
    await store.set({
      //This method does not update whole document, but only updated fields that we have to provided it
      "name": name,
      "password": password,
    }, SetOptions(merge: true));
  }

  changeAuthPassword({email, password, newpassowrd}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    //after that we need to upadate authenctication process(means k user login ho ske newpassword k sath)
    await currentUser!
        .reauthenticateWithCredential(cred)
        . //user ko again login krwa rehy han
        then((value) {
      isNewPasswordVisible(false);
      isPasswordVisible(false);

      currentUser!.updatePassword(newpassowrd);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
