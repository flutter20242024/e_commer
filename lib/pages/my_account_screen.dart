import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/bloc/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/helper/functions_helper.dart';
import 'package:e_commerce/network/apis_const.dart';
import 'package:e_commerce/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  XFile? image;

  bool enable = false;

  final _firstNameController = TextEditingController();
  final _lasttNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _firstNameController.text = firstName!;
    _lasttNameController.text = lastName!;
    _emailController.text = email ?? "";
    _phoneController.text = phone!;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lasttNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("MyAccountScreen"),
            actions: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {
                  setState(() {
                    enable = !enable;
                  });
                },
                icon: Icon(
                  enable ? Icons.edit : Icons.lock,
                  size: 25,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.file(
                                        File(image!.path),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: CachedNetworkImage(
                                        imageUrl: profileImage != null
                                            ? ApisConst.baseUrlImage +
                                                profileImage!
                                            : "",
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator())),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                            ),
                            enable
                                ? Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        pickImageFromGallery().then((value) {
                                          image = value;
                                          setState(() {});
                                          if (image != null) {
                                            BlocProvider.of<AuthCubit>(context)
                                                .uploadImage(
                                                    file: File(image!.path));
                                          }
                                        });
                                      },
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  LabelWidget(
                    label: "First name",
                  ),
                  _space(hight: 10),
                  TextFieldWidget(
                      controller: _firstNameController,
                      enable: enable,
                      hint: "First name",
                      icon: Icons.person),
                  _space(hight: 10),
                  LabelWidget(
                    label: "Last name",
                  ),
                  _space(hight: 10),
                  TextFieldWidget(
                      controller: _lasttNameController,
                      enable: enable,
                      hint: "Last name",
                      icon: Icons.person),
                  _space(hight: 10),
                  LabelWidget(
                    label: "Email",
                  ),
                  _space(hight: 10),
                  TextFieldWidget(
                      controller: _emailController,
                      hint: "Email",
                      enable: false,
                      icon: Icons.person),
                  _space(),
                  LabelWidget(
                    label: "Phone",
                  ),
                  _space(hight: 10),
                  TextFieldWidget(
                      controller: _phoneController,
                      hint: "Phone",
                      enable: enable,
                      icon: Icons.person),
                  _space(hight: 30),
                  enable
                      ? state.editProfileState == true
                          ? CircularProgressIndicator()
                          : MaterialButton(
                              onPressed: () {
                                AuthCubit.get(context).editProfile(
                                  context: context,
                                    id: userId!,
                                    fName: _firstNameController.text,
                                    lName: _lasttNameController.text,
                                    phoneNumber: _phoneController.text,
                                    image: AuthCubit.get(context).imageUser!);
                              },
                              color: Colors.blue,
                              child: Text(
                                "حفظ التغيرات",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                      : SizedBox()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SizedBox _space({double? hight}) => SizedBox(
        height: hight ?? 35,
      );
}

class LabelWidget extends StatelessWidget {
  final String label;
  const LabelWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    );
  }
}
