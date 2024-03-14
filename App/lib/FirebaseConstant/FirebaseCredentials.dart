import 'package:anjumali/constanst.dart';

FirebaseAuth auth = FirebaseAuth.instance; //For Authentication
FirebaseFirestore firestore =
    FirebaseFirestore.instance; //use to store and get data from cloud store
User? currentUser = auth.currentUser;
//collection
const userCollection = "user";
