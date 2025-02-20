import 'package:events_app/common/Util/slide_to_page_route.dart';
import 'package:events_app/common/components/general/defult_button.dart';
import 'package:events_app/common/controllers/auth/regester_controller.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:events_app/common/view/auth/login_page.dart';
import 'package:events_app/common/view/auth/regester_page.dart';
import 'package:events_app/common/view/first_open/onBoading/third_boading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
        backgroundColor: ThemesStyles.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            color: ThemesStyles.textColor,
            onPressed: () {
              Navigator.push(
                context,
                SlidToPage(
                  page: const ThirdBoading(),
                  onComplete: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdBoading()));
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //1
              const Text(
                "Welcome to UpTodo",
                style: TextStyle(
                  fontSize: 34,
                  color: ThemesStyles.textColor,
                ),
              ),
              //2
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                width: 350,
                child: Text(
                  'Please login to your account or create new account to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ThemesStyles.textColor.withOpacity(.8),
                  ),
                ),
              ),
              //3
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              //4
              //NOTE: u can find this Widgit in lip/widgits/auth
              DefultButton(
                borderColor: Colors.transparent,
                buttonColor: ThemesStyles.primary,
                title: "LOGIN",
                onPressed: () {
                  Navigator.push(
                    context,
                    SlidToPage(
                      page: const LoginPage(),
                      onComplete: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              //5
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: DefultButton(
                  borderColor: ThemesStyles.primary,
                  buttonColor: ThemesStyles.background,
                  title: "CREATE ACCOUNT",
                  onPressed: () {
                    //go to Regester Page
                    Navigator.push(
                      context,
                      SlidToPage(
                        page: const RegisterPage(),
                        onComplete: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
