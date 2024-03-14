import "package:anjumali/constanst.dart";

Widget Buttons({String? title, onPress, width}) {
  return ElevatedButton(
    onPressed: onPress,
    child: title!.text.make(),
  ).box.width(width).make();
}

class listButton {
  final IconData icon;
  final String title;
  final void Function()? onpress;

  listButton(this.icon, this.title, this.onpress);
}
