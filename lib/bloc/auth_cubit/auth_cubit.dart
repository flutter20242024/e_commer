import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/functions_helper.dart';
import '../../models/response_login.dart';
import '../../network/apis_const.dart';
import '../../pages/login_screen.dart';
import '../../pages/navigation_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  static AuthCubit get(context) => BlocProvider.of(context);

  // ! login api

  List<String> errors = [];

  login(String emailUser, String password, BuildContext context) async {
    emit(AuthState(loginState: true));
    final response = await http.post(Uri.parse(ApisConst.loginEndPoint),
        body: {"email": emailUser, "password": password, "token": "jnkcs"});

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      ResponseLogin loginResponse = ResponseLogin.fromJson(jsonResponse);

      if (loginResponse.status == true) {
        print(loginResponse.message);

        token = loginResponse.data!.token;
        firstName = loginResponse.data!.user!.firstName;
        lastName = loginResponse.data!.user!.lastName;
        email = emailUser;
        userId = loginResponse.data!.user!.id;
        phone = loginResponse.data!.user!.phoneNumber;
        profileImage = loginResponse.data!.user!.profileImage;

        /// save data
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", loginResponse.data!.token!);
        prefs.setString("name", loginResponse.data!.user!.firstName!);
        prefs.setString("lastName", loginResponse.data!.user!.lastName!);
        prefs.setString("email", loginResponse.data!.user!.userName!);
        prefs.setString("id", loginResponse.data!.user!.id!);
        prefs.setString(
            "profileImage", loginResponse.data!.user!.profileImage ?? "");
        prefs.setString("phone", loginResponse.data!.user!.phoneNumber!);

        prefs.setBool("login", true);

        displayToast("مبروك تم تسجيل الدخول بنجاح", Colors.green);

        navToPage(context: context, page: const NavigationScreen());
        emit(AuthState(loginState: false));
      } else {
        displayToast("${loginResponse.message}", Colors.red);
        emit(AuthState(loginState: false));
      }
    } else {
      displayToast("حدث خطا", Colors.red);
      emit(AuthState(loginState: false));
    }
  }

  // ! register api

  siginUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phone,
      required BuildContext context}) async {
    emit(AuthState(loginState: true));
    final response =
        await http.post(Uri.parse(ApisConst.registerEndPoint), body: {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'Password': password,
      'Role': 'user',
      'PhoneNumber': phone,
      'userName': email
    });

    if (response.statusCode == 200) {
      displayToast("تم تسجيل الدخول بنجاح", Colors.green);
      navToPage(context: context, page: const LoginScreen());

      emit(AuthState(loginState: false));
    } else {
      displayToast("خطا في تسجيل الدخول", Colors.red);
      emit(AuthState(loginState: false));
    }
  }

// ! get user data api

// ! update user data api
  String? imageUser;
  Future uploadImage({required File file}) async {
    String fileName = file.path.split('/').last;
    var request =
        http.MultipartRequest('POST', Uri.parse(ApisConst.uploadImagesPath));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();

      imageUser = jsonResponse;

      print(jsonResponse);
    } else {
      print(response.reasonPhrase);
    }
  }

  // ! edit profifle

  Future editProfile(
      {required String id,
      required String fName,
      required String lName,
      required String phoneNumber,
      required String? image,
      required BuildContext context}) async {
    emit(AuthState(editProfileState: true));

    final response = await http.put(Uri.parse(ApisConst.updateUserPath), body: {
      "id": id,
      "firstName": fName,
      "lastName": lName,
      "phoneNumber": phoneNumber,
      "profileImage": image
    });

    if (response.statusCode == 200) {
      if (image != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("profileImage", image);
        prefs.setString("name", fName);
        prefs.setString("lastName", lName);

        profileImage = image;
        firstName = fName;
        lastName = lName;
        phone = phoneNumber;
      }
      displayToast("تم تعديل البيانات بنجاح", Colors.green);

      getUserData();

      navToPage(context: context, page: SplashScreen());

      emit(AuthState(editProfileState: false));
    } else {
      print(response.statusCode.toString());
      displayToast("خطا في تعديل البيانات", Colors.red);

      emit(AuthState(editProfileState: false));
    }
  }
}
