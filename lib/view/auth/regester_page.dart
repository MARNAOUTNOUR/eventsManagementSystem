import 'package:events_app/components/auth/Costume_TextField_widget.dart';
import 'package:events_app/components/general/defult_button.dart';
import 'package:events_app/controllers/auth/regester_controller.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:events_app/view/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          color: ThemesStyles.textColor,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      backgroundColor: ThemesStyles.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        100), // Half of container width/height for perfect circle
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/Logo.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                //1
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 34,
                      color: ThemesStyles.textColor,
                    ),
                  ),
                ),
                CustomeTextFormField(
                  hintText: 'Enter your Username',
                  inputType: TextInputType.text,
                  title: 'Username',
                  controller: controller.usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomeTextFormField(
                  hintText: 'Enter your Email',
                  inputType: TextInputType.text,
                  title: 'Email',
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomeTextFormField(
                  hintText: 'Enter your residence place',
                  inputType: TextInputType.text,
                  title: 'Residence Place',
                  controller: controller.residencePlaceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your residence place';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomeTextFormField(
                  inputType: TextInputType.text,
                  hintText: '••••••••••••••••',
                  title: 'Password',
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomeTextFormField(
                  inputType: TextInputType.text,
                  hintText: '••••••••••••••••',
                  title: 'Confirm Password',
                  controller: controller.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                DefultButton(
                  textColor: ThemesStyles.seconndTextColor,
                  buttonColor: ThemesStyles.primary,
                  borderColor: Colors.transparent,
                  title: "Register",
                  onPressed: controller.register,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //5
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                          height: 20, thickness: 2, color: Color(0xff696969)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or",
                        style: TextStyle(color: ThemesStyles.textColor),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                          height: 20, thickness: 2, color: Color(0xff696969)),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //Sign in by Google
                DefultButton(
                  textColor: Theme.of(context).brightness == Brightness.dark
                      ? ThemesStyles.seconndTextColor
                      : ThemesStyles.textColor,
                  buttonColor: Colors.transparent,
                  borderColor: ThemesStyles.primary,
                  title: "Register with Google",
                  icon: Image.asset(
                    'assets/images/Google.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    //Sign in by GOOGLE
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Color(0xff696969)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginPage());
                        },
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white, width: 1.0)),
                          ),
                          child: Text(
                            "Login.",
                            style: TextStyle(
                              color: ThemesStyles.textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
