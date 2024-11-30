import 'package:e_commerce/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/helper/functions_helper.dart';
import 'package:e_commerce/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/text_field_widget.dart';

class SiginUpScreen extends StatefulWidget {
  const SiginUpScreen({super.key});

  @override
  State<SiginUpScreen> createState() => _SiginUpScreenState();
}

class _SiginUpScreenState extends State<SiginUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          "انشاء حساب جديد",
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
                  controller: _firstNameController,
                  hint: "الاسم الاول",
                  icon: Icons.person),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controller: _lastNameController,
                  hint: "الاسم الثاني",
                  icon: Icons.person),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controller: _phoneController,
                  hint: "رقم الهاتف",
                  icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controller: _emailController,
                  hint: "البريد الالكتروني",
                  icon: Icons.email),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controller: _passwordController,
                  hint: "الرقم السري",
                  icon: Icons.lock),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return state.loginState!?
                   const Center(child: CircularProgressIndicator()):
                   MaterialButton(
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      if (isValidate()) {
                        
                        BlocProvider.of<AuthCubit>(context).siginUp(
                            email: _emailController.text,
                            password: _passwordController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            phone: _phoneController.text,
                            context: context);

                      }
                    },
                    child: const Text(
                      "انشاء حساب جديد",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    navToPage(context: context, page: const LoginScreen());
                  },
                  child: const Text(
                    "نعم لدي حساب ",
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
  }

  // GET
  // POST
  // PUT
  // DELETE

  bool isValidate() {
    if (_firstNameController.text.isEmpty) {
      displayToast("الرجاء ادخال الاسم الاول", Colors.red);
      return false;
    } else if (_lastNameController.text.isEmpty) {
      displayToast("الرجاء ادخال الاسم الثاني", Colors.red);
      return false;
    } else if (_phoneController.text.isEmpty) {
      displayToast("الرجاء ادخال رقم الهاتف", Colors.red);
      return false;
    } else if (_emailController.text.isEmpty) {
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
