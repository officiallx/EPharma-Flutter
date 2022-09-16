import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine/View/home.dart';
import 'package:medicine/services/login_service.dart';

import '../Styles/appcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    Future doLogin() async {
      EasyLoading.show(status: "Logging In");
      final client =
          LoginService(Dio(BaseOptions(contentType: "application/json")));
      try {
        if (usernameController.text != "" && passwordController.text != "") {
          var response = await client.doLogin(
              usernameController.text, passwordController.text);
          if (response.message == "OK") {
            EasyLoading.dismiss();
            EasyLoading.showSuccess("Success");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError("Fill all required fields.");
        }
      } on DioError {
        EasyLoading.dismiss();
        EasyLoading.showError("Username or password is incorrect");
      }
    }

    @override
    void setState(fn) {
      if (mounted) {
        super.setState(fn);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  "assets/json/delivery.json",
                  repeat: false,
                  height: 200,
                  width: 200,
                ),
                Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        showCursor: false,
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.primary,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.primary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          label: Text(
                            "Username",
                            style: GoogleFonts.montserrat(
                                fontSize: 12, letterSpacing: 1.5),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        showCursor: false,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.primary),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.primary),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          label: Text(
                            "Password",
                            style: GoogleFonts.montserrat(
                                fontSize: 12, letterSpacing: 1.5),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_open_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.primary),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(330, 30)),
                  ),
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 1.3, color: AppColor.whiteText),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    await doLogin();
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "© ${DateTime.now().year} EPharma",
                        style: const TextStyle(
                            color: AppColor.lightText, fontSize: 12),
                      ),
                      const Text(
                        "Version 1.0",
                        style:
                            TextStyle(color: AppColor.lightText, fontSize: 10),
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
