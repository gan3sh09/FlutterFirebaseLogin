import 'package:flutter/material.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/screens/login_screen/layout/login_footer_widget.dart';
import 'package:loginapp/src/features/authentication/screens/login_screen/layout/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: logoImage,
                  title: loginTitle,
                  subTitle: loginSubTitle,
                ),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
