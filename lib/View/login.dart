import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.primary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        overlayColor:
                            MaterialStateProperty.all<Color>(AppColor.primary),
                        checkColor: Colors.white,
                        activeColor: AppColor.primary,
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      Text(
                        "Remember Me",
                        style: const TextStyle(fontSize: 13.0),
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
                    FocusScope.of(context).requestFocus(FocusNode());
                    EasyLoading.show(status: "Logging In");
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "© ${DateTime.now().year} Medicine App",
                        style: const TextStyle(
                            color: AppColor.lightText, fontSize: 12),
                      ),
                      Text(
                        "Version 1.0",
                        style: const TextStyle(
                            color: AppColor.lightText, fontSize: 10),
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
