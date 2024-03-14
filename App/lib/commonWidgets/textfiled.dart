import 'package:anjumali/constanst.dart';

Widget textFields(
    {String? hint, String? label, secure, Textcontroller, IconButton}) {
  return TextFormField(
    controller: Textcontroller,
    obscureText: secure,
    decoration: InputDecoration(
        suffixIcon: IconButton,
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        )),
  );
}
