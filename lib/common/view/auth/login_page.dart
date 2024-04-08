import 'package:events_app/common/Util/slide_to_page_route.dart';
import 'package:events_app/common/components/auth/Costume_TextField_widget.dart';
import 'package:events_app/common/components/general/defult_button.dart';
import 'package:events_app/common/controllers/auth/login_controller.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:events_app/common/view/auth/regester_page.dart';
import 'package:events_app/common/view/first_open/welcom_page.dart';
import 'package:events_app/User_App/view/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Get.offAll(const WelcomPage());
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "SKIP",
              ),
            ],
          ),
        ),
        titleTextStyle: const TextStyle(color: Color(0xff464646), fontSize: 16),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Form(
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
                        "Login",
                        style: TextStyle(
                          fontSize: 34,
                          color: ThemesStyles.textColor,
                        ),
                      ),
                    ),
                    //2
                    CustomeTextFormField(
                      hintText: 'Enter your Username or Emile',
                      inputType: TextInputType.text,
                      title: 'Username|Emile',
                      //Emile validator
                      controller: controller.usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username or email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    //3
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
                    //====================================Forget password =====================================
                    GestureDetector(
                      onTap: () {
                        //here will show dialog
                      },
                      child: const Text(
                        "Forget the password?",
                        style: TextStyle(
                          color: ThemesStyles.primary,
                        ),
                      ),
                    ),
                    //====================================Forget password =====================================
                    const SizedBox(
                      height: 70,
                    ),
                    //4
                    DefultButton(
                      buttonColor: ThemesStyles.primary,
                      borderColor: Colors.transparent,
                      textColor: ThemesStyles.seconndTextColor,
                      title: "Login",
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    //=====================================Google==========================================
                    const SizedBox(height: 30),
                    //5
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 20,
                            thickness: 2,
                            color: Color(0xff696969),
                          ),
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
                            height: 20,
                            thickness: 2,
                            color: Color(0xff696969),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //Sign in by Google
                    DefultButton(
                      buttonColor: Colors.transparent,
                      textColor: Theme.of(context).brightness == Brightness.dark
                          ? ThemesStyles.seconndTextColor
                          : ThemesStyles.textColor,
                      borderColor: ThemesStyles.primary,
                      title: "Login with Google",
                      icon: Image.asset(
                        'assets/images/Google.png',
                        width: 40,
                        height: 40,
                      ),
                      onPressed: () {
                        //Sign in by GOOGLE
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Color(0xff696969)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const RegisterPage());
                            },
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 1.0)),
                              ),
                              child: Text(
                                "Register.",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
