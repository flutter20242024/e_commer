
import 'package:e_commerce/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
String? firstName;
String? lastName;
String? userId;
String? email;
String? phone;
String? profileImage;

navToPage({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

displayToast(String msg, Color color) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

getUserData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  firstName = prefs.getString('name');
  lastName = prefs.getString('lastName');
  userId = prefs.getString('id');
  email = prefs.getString('email');
  phone = prefs.getString('phone');
  profileImage = prefs.getString('profileImage');
}

bool isLogin() {
  if (token == null) {
    return false;
  } else {
    return true;
  }
}

signOut(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('name');

  prefs.remove('id');
  prefs.remove('email');
  token = null;
  firstName = null;
  userId = null;
  email = null;

  navToPage(context: context, page: const LoginScreen());
}

Future<XFile?> pickImageFromGallery() async {
  try {
    final picker = ImagePicker();

    var pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    return pickedFile!;
  } catch (e) {
    return null;
  }
}
