import 'package:e_commerce/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/helper/functions_helper.dart';

import 'package:e_commerce/pages/sigin_up_screen.dart';
import 'package:e_commerce/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            title: const Text(
              "تسجيل الدخول",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  TextFieldWidget(
                      controller: _emailController,
                      hint: "البريد الالكتروني",
                      icon: Icons.email),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldWidget(
                      controller: _passwordController,
                      hint: "الرقم السري",
                      icon: Icons.lock),
                  const SizedBox(
                    height: 50,
                  ),
                   state.loginState!
                      ? const CircularProgressIndicator()
                      : MaterialButton(
                          color: Colors.blue,
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            if (isValidate()) {
                              BlocProvider.of<AuthCubit>(context).login(
                                  _emailController.text,
                                  _passwordController.text,
                                  context);
                            }
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        navToPage(
                            context: context, page: const SiginUpScreen());
                      },
                      child: const Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool isValidate() {
    if (_emailController.text.isEmpty) {
      displayToast("الرجاء ادخال البريد الالكتروني", Colors.red);
      return false;
    } else if (_passwordController.text.isEmpty) {
      displayToast("الرجاء ادخال الرقم السري", Colors.red);
      return false;
    } else {
      return true;
    }
  }
}
