import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttergram/helper.dart';
import 'package:fluttergram/resources/auth_methods.dart';
import 'package:fluttergram/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: lcolor,
                height: 64,
              ),
              const SizedBox(
                height: 16,
              ),

// add avatar

              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage:
                              AssetImage('assets/circular_avatar.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () => selectImage(),
                        icon: const Icon(Icons.add_a_photo)),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  isPassword: false,
                  hintText: 'Username',
                  textEditingController: _userController,
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  isPassword: false,
                  hintText: 'Email',
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  isPassword: true,
                  hintText: 'Password',
                  textEditingController: _passwordController,
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  isPassword: false,
                  hintText: 'Bio',
                  textEditingController: _bioController,
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String res = await AuthMethod().userSignUp(
                        email: _emailController.text,
                        password: _passwordController.text,
                        username: _userController.text,
                        bio: _bioController.text,
                        file: _image!);
                    print(res);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: const Text('Sign up'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
